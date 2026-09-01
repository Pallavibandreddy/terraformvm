import { useEffect, useState } from "react";
import "./App.css";

function App() {
  const [apiStatus, setApiStatus] = useState("Checking...");
  const [apiInfo, setApiInfo] = useState("");

  const API_URL = import.meta.env.VITE_API_URL || "http://localhost:3000";

  useEffect(() => {
    fetch(`${API_URL}/health`)
      .then((response) => response.json())
      .then((data) => {
        setApiStatus(data.status === "healthy" ? "Online" : "Offline");
      })
      .catch(() => {
        setApiStatus("Offline");
      });

    fetch(`${API_URL}/api/info`)
      .then((response) => response.json())
      .then((data) => {
        setApiInfo(`${data.backend} • ${data.deployment}`);
      })
      .catch(() => {
        setApiInfo("Unable to connect to API");
      });
  }, [API_URL]);

  return (
    <div className="app">
      <nav className="navbar">
        <div className="brand">
          <span className="logo">⚡</span>
          <span>DevFlow</span>
        </div>

        <div className="api-status">
          <span className="status-dot"></span>
          API {apiStatus}
        </div>
      </nav>

      <main className="main">
        <section className="hero">
          <div className="badge">
            FULL STACK CI/CD
          </div>

          <h1>
            Build once.
            <br />
            <span>Deploy smarter.</span>
          </h1>

          <p>
            A simple full-stack application demonstrating
            conditional CI/CD with GitHub Actions and Azure.
          </p>
        </section>

        <section className="cards">

          <div className="card">
            <div className="card-icon">◈</div>

            <div className="card-content">
              <span className="label">FRONTEND</span>

              <h2>React + TypeScript</h2>

              <p>
                Modern frontend built with Vite
                and TypeScript.
              </p>

              <div className="technology">
                ✓ Build ready
              </div>
            </div>
          </div>

          <div className="card">
            <div className="card-icon">⌘</div>

            <div className="card-content">
              <span className="label">BACKEND</span>

              <h2>Node + Express</h2>

              <p>
                Lightweight REST API powering
                the application.
              </p>

              <div className="technology">
                ✓ {apiStatus}
              </div>
            </div>
          </div>

        </section>

        <section className="pipeline">

          <div className="section-title">
            <span>CI/CD PIPELINE</span>
            <small>GitHub Actions</small>
          </div>

          <div className="pipeline-flow">

            <div className="pipeline-step active">
              <div className="step-number">01</div>
              <h3>Detect</h3>
              <p>Detect changed code</p>
            </div>

            <div className="line"></div>

            <div className="pipeline-step">
              <div className="step-number">02</div>
              <h3>Build</h3>
              <p>Build changed component</p>
            </div>

            <div className="line"></div>

            <div className="pipeline-step">
              <div className="step-number">03</div>
              <h3>Deploy</h3>
              <p>Deploy to Azure</p>
            </div>

          </div>

        </section>

        <section className="info">
          <span>●</span>
          {apiInfo || "Connecting to API..."}
        </section>

      </main>

      <footer>
        Task 6 • Conditional CI/CD Demonstration
      </footer>
    </div>
  );
}

export default App;