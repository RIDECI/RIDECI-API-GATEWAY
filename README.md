# API Gateway — RIDECI

👥 Participating teams:

	🏛️ TROYA
	🌊 POSEIDON
	⚔️ NEMESIS
	🧠 ATENEA
	💪 KRATOS
	🔱 HADES

🧭 Overview
--------
This repository contains the API Gateway configuration for the RIDECI ecosystem. The gateway uses Kong (declarative configuration) and is intended to route requests to the platform microservices (travels, users, communications, authentication, profiles, notifications, etc.). The main Kong configuration file is `config/kong.yml` and the gateway is run via Docker Compose.

📦 What this repo provides
-----------------------
- A Docker Compose service that runs Kong in DB-less (declarative) mode using `config/kong.yml`.
- A sample `.env.example` to provide downstream service URLs (the compose file reads environment variables referenced by Kong).

🛠️ Technologies
------------
- Kong Gateway (DB-less / declarative mode)
- Docker & Docker Compose
- decK (optional, for declarative config management) — not required but useful for syncing configs
- Environment files (`.env`) for service endpoint configuration

### 🛠️ DevOps & Infrastructure
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Docker Compose](https://img.shields.io/badge/docker--compose-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Kong](https://img.shields.io/badge/kong-%23000000.svg?style=for-the-badge&logo=kong&logoColor=white) ![decK](https://img.shields.io/badge/decK-%23007ACC.svg?style=for-the-badge&logo=kong&logoColor=white) ![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

### 🚀 Hosting & CI/CD
![Railway](https://img.shields.io/badge/Railway-131415.svg?style=for-the-badge&logo=railway&logoColor=white) ![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

### 🧪 Testing
![Postman](https://img.shields.io/badge/Postman-FF6C37.svg?style=for-the-badge&logo=postman&logoColor=white)

🗂️ Repository layout
-----------------
- `config/kong.yml` — Kong declarative configuration (services and routes)
- `docker-compose.yml` — Docker Compose service definition for Kong
- `.env.example` — environment variables template

⚡ Quick run (recommended)
-----------------------
Follow these steps to run the gateway locally and route traffic to the configured upstream services.

1) ✅ Prerequisites

- Docker
- Docker Compose (v2 / `docker compose`) or compatible
- Optional: decK (https://docs.konghq.com/deck/) if you want to manage Kong configs programmatically

2) ✏️ Copy and edit environment variables

```bash
cp .env.example .env
# Edit .env and set the service URLs like URL_TRAVELS, URL_USERS, etc.
```

Make sure the URLs point to reachable services. If you don't have actual services running, you can point them to mocks or public endpoints for testing.

3) 🐳 Start Kong with Docker Compose

```bash
docker compose up -d
```

This starts Kong with the `config` folder mounted and `KONG_DECLARATIVE_CONFIG` set to `/config/kong.yml`. Kong will load the routes declared in that file.

After the container is up, you can use Postman to test proxied endpoints on port 8000 (for example: `http://localhost:8000/travels`, `http://localhost:8000/users`, `http://localhost:8000/conversations`, `http://localhost:8000/auth`, `http://localhost:8000/profiles`, `http://localhost:8000/notifications`).

⚙️ Configuration notes
-------------------
- `config/kong.yml` contains service definitions and route paths. The upstream URLs in the file are placeholders and may be overridden by environment variables injected into the Kong container via `docker-compose.yml`.
- `docker-compose.yml` uses `env_file: .env` so make sure `.env` exists and contains the variables referenced there.
