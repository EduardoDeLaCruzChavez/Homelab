# Homelab Docker Infrastructure

A collection of Docker containers and configurations for my personal homelab environment.

The repository primarily includes shared infrastructure and self-hosted services focused on productivity, developer tracking, personal finance, system telemetry, and centralized authentication.

## Architecture

```text
Client
  │
  ▼
Nginx (Reverse Proxy)
  │
  ├──────► Authelia (SSO / Access Control)
  │
  ├── Applications
  │    ├── Homepage
  │    ├── Wakapi
  │    ├── Vikunja
  │    ├── Vaultwarden
  │    └── Actual Budget
  │
  ├── Monitoring
  │    └── Beszel
  │
  └── Administration
       └── pgAdmin
           │
           ▼
        PostgreSQL
```

## Services

### Security & Authentication
* **Authelia** — Centralized single sign-on (SSO) and multi-factor authentication proxy.

### Applications

* **Homepage** — Homelab dashboard
* **Wakapi** — Coding activity tracking
* **Vikunja** — Task and project management
* **Vaultwarden** — Self-hosted password manager
* **Actual Budget** — Local-first personal finance and budgeting system

### Monitoring

* **Beszel** — Server and container monitoring

### Administration

* **pgAdmin** — PostgreSQL administration

### Infrastructure

* **Nginx** — Reverse proxy and SSL termination
* **PostgreSQL** — Shared database service

The goal is to keep the homelab infrastructure organized, reproducible, and easy to maintain using Docker and Docker Compose.

