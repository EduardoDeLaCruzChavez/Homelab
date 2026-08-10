# Homelab Docker Infrastructure

A collection of Docker containers and configurations for my personal homelab environment.

The repository primarily includes shared infrastructure and self-hosted services such as:

## Architecture

```text
Client
  │
  ▼
Nginx
Reverse Proxy
  │
  ├── Applications
  │   ├── Homepage
  │   ├── Wakapi
  │   ├── Vikunja
  │   └── Vaultwarden
  │
  ├── Monitoring
  │   └── Beszel
  │
  └── Administration
      └── pgAdmin
          │
          ▼
      PostgreSQL
```

## Services

### Applications

* **Homepage** — Homelab dashboard
* **Wakapi** — Coding activity tracking
* **Vikunja** — Task and project management
* **Vaultwarden** — Self-hosted password manager

### Monitoring

* **Beszel** — Server and container monitoring

### Administration

* **pgAdmin** — PostgreSQL administration

### Infrastructure

* **Nginx** — Reverse proxy and SSL termination
* **PostgreSQL** — Shared database service

The goal is to keep the homelab infrastructure organized, reproducible, and easy to maintain using Docker and Docker Compose.

