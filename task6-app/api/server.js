const express = require("express");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    application: "DevFlow API",
    version: "1.0.0",
    message: "API is running successfully"
  });
});

app.get("/health", (req, res) => {
  res.json({
    status: "healthy",
    service: "DevFlow API"
  });
});

app.get("/api/info", (req, res) => {
  res.json({
    frontend: "React + TypeScript",
    backend: "Node.js + Express",
    deployment: "GitHub Actions + Azure"
  });
});

app.listen(PORT, () => {
  console.log(`DevFlow API running on port ${PORT}`);
});

