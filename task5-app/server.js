const express = require("express");
const sql = require("mssql");
const { DefaultAzureCredential } = require("@azure/identity");
const { SecretClient } = require("@azure/keyvault-secrets");

// --------------------------------------------------
// Application Insights
// --------------------------------------------------
if (process.env.APPINSIGHTS_INSTRUMENTATIONKEY) {
    const appInsights = require("applicationinsights");

    appInsights
        .setup()
        .setAutoCollectRequests(true)
        .setAutoCollectPerformance(true)
        .setAutoCollectExceptions(true)
        .setAutoCollectDependencies(true)
        .start();

    console.log("Application Insights enabled");
}

// --------------------------------------------------
// Express
// --------------------------------------------------
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// --------------------------------------------------
// Azure Managed Identity
// --------------------------------------------------
const credential = new DefaultAzureCredential();

const sqlServer = process.env.SQL_SERVER;
const sqlDatabase = process.env.SQL_DATABASE;
const keyVaultUrl = process.env.KEY_VAULT_URL;

// --------------------------------------------------
// Get Azure SQL access token
// --------------------------------------------------
async function getSqlToken() {
    const tokenResponse = await credential.getToken(
        "https://database.windows.net/.default"
    );

    return tokenResponse.token;
}

// --------------------------------------------------
// SQL connection
// --------------------------------------------------
async function getSqlConnection() {
    const token = await getSqlToken();

    const config = {
        server: sqlServer,
        database: sqlDatabase,

        authentication: {
            type: "azure-active-directory-access-token",
            options: {
                token: token
            }
        },

        options: {
            encrypt: true,
            trustServerCertificate: false
        }
    };

    return await sql.connect(config);
}

// --------------------------------------------------
// Key Vault test
// --------------------------------------------------
async function getKeyVaultSecret() {
    if (!keyVaultUrl) {
        return "Key Vault URL not configured";
    }

    const client = new SecretClient(keyVaultUrl, credential);

    try {
        const secret = await client.getSecret("app-message");

        return secret.value || "No secret value";
    } catch (error) {
        console.log("Key Vault secret not available:", error.message);
        return "Key Vault connection available";
    }
}

// --------------------------------------------------
// Home page
// --------------------------------------------------
app.get("/", async (req, res) => {
    let users = [];

    try {
        const pool = await getSqlConnection();

        const result = await pool
            .request()
            .query(`
                SELECT Id, Name, Email, Message, CreatedAt
                FROM Users
                ORDER BY Id DESC
            `);

        users = result.recordset;

        await pool.close();
    } catch (error) {
        console.error("SQL Error:", error.message);
    }

    const rows = users
        .map(
            user => `
            <tr>
                <td>${user.Id}</td>
                <td>${user.Name}</td>
                <td>${user.Email}</td>
                <td>${user.Message || ""}</td>
                <td>${user.CreatedAt}</td>
            </tr>
        `
        )
        .join("");

    res.send(`
        <!DOCTYPE html>
        <html>
        <head>
            <title>DevOps App - Task 5</title>

            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 40px;
                    background: #f4f6f8;
                }

                .container {
                    max-width: 1000px;
                    margin: auto;
                }

                h1 {
                    color: #333;
                }

                form {
                    background: white;
                    padding: 25px;
                    border-radius: 10px;
                    margin-bottom: 30px;
                    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                }

                label {
                    display: block;
                    margin-top: 15px;
                    font-weight: bold;
                }

                input,
                textarea {
                    width: 100%;
                    padding: 10px;
                    margin-top: 5px;
                    box-sizing: border-box;
                }

                textarea {
                    height: 100px;
                }

                button {
                    margin-top: 20px;
                    padding: 12px 25px;
                    background: #0078d4;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }

                button:hover {
                    background: #005a9e;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    background: white;
                }

                th,
                td {
                    padding: 12px;
                    border: 1px solid #ddd;
                    text-align: left;
                }

                th {
                    background: #0078d4;
                    color: white;
                }

                .status {
                    background: #e8f5e9;
                    padding: 15px;
                    margin-bottom: 20px;
                    border-radius: 5px;
                }
            </style>
        </head>

        <body>

        <div class="container">

            <h1>DevOps App - Task 5</h1>

            <div class="status">
                Application connected to Azure infrastructure.
            </div>

            <form method="POST" action="/users">

                <h2>Enter User Data</h2>

                <label>Name</label>
                <input
                    type="text"
                    name="name"
                    placeholder="Enter your name"
                    required
                >

                <label>Email</label>
                <input
                    type="email"
                    name="email"
                    placeholder="Enter your email"
                    required
                >

                <label>Message</label>
                <textarea
                    name="message"
                    placeholder="Enter your message"
                ></textarea>

                <button type="submit">
                    Save Data
                </button>

            </form>

            <h2>Saved Data</h2>

            <table>

                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                    <th>Created At</th>
                </tr>

                ${rows}

            </table>

        </div>

        </body>
        </html>
    `);
});

// --------------------------------------------------
// Save data to SQL
// --------------------------------------------------
app.post("/users", async (req, res) => {

    const { name, email, message } = req.body;

    try {

        const pool = await getSqlConnection();

        await pool
            .request()
            .input("name", sql.NVarChar(100), name)
            .input("email", sql.NVarChar(255), email)
            .input("message", sql.NVarChar(500), message)
            .query(`
                INSERT INTO Users
                (
                    Name,
                    Email,
                    Message
                )
                VALUES
                (
                    @name,
                    @email,
                    @message
                )
            `);

        await pool.close();

        console.log("Data saved successfully");

        res.redirect("/");

    } catch (error) {

        console.error("Database insert error:", error);

        res.status(500).send(`
            <h1>Database Error</h1>
            <p>${error.message}</p>
            <br>
            <a href="/">Go Back</a>
        `);
    }
});

// --------------------------------------------------
// Health check
// --------------------------------------------------
app.get("/health", (req, res) => {
    res.json({
        status: "healthy",
        application: "Task 5 DevOps App"
    });
});

// --------------------------------------------------
// Start server
// --------------------------------------------------
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});