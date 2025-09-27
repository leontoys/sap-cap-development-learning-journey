# CAP Deployment Lab

This repository demonstrates how to deploy SAP Cloud Application Programming Model (CAP) applications to **non-SAP platforms** like [Render](https://render.com) — **without Docker, without BTP**, and using **standard Node.js tooling**.

## 🚀 Current Deployment

- **App**: [Incident Management Reference App](https://github.com/cap-js/incidents-app)
- **Live URL**: https://incidents-app.onrender.com/incidents/webapp/
- **Features**:
  - OData v4 services (`/odata/v4/processor/Incidents`)
  - Fiori-like UI built with CAP annotations
  - SQLite database (initialized on every startup)
  - Mocked authentication

## 🔧 How It Works

- Uses `cds-serve` (from `@sap/cds`) as the production entry point
- Initializes database via `prestart: "cds deploy --to sqlite:db.sqlite"`
- Runs on Node.js v20 (enforced via `NODE_VERSION` in Render)
- No `@sap/cds-dk` in production dependencies (only for local dev)

> 💡 This project shows that **CAP apps can run anywhere Node.js runs** — not just on SAP BTP.
