# Shared Environment Configuration

This homelab uses a single `.env` file located at the repository root. Each Docker Compose project uses a symbolic link to this shared file, keeping common environment variables centralized and avoiding duplicated configuration.

## Structure

```text
homelab/
├── .env
├── proxy/
│   └── .env -> ../.env
├── services/
│   └── .env -> ../.env
└── monitoring/
    └── .env -> ../.env
```

Create the shared `.env` file in the repository root:

```env
BASE_URL=https://homelab.local
# Add other shared variables here
```

## Linux

From the repository root:

```bash
ln -s "$PWD/.env" proxy/.env
ln -s "$PWD/.env" services/.env
ln -s "$PWD/.env" monitoring/.env
```

Verify the links:

```bash
ls -la proxy/.env services/.env monitoring/.env
```

They should point to the root `.env` file.

## Windows

Run the following commands from the repository root in **PowerShell**:

```powershell
New-Item -ItemType SymbolicLink -Path "$PWD/proxy/.env" -Target "$PWD/.env"
New-Item -ItemType SymbolicLink -Path "$PWD/services/.env" -Target "$PWD/.env"
New-Item -ItemType SymbolicLink -Path "$PWD/monitoring/.env" -Target "$PWD/.env"
```

> **Note:** Creating symbolic links on Windows may require Developer Mode or administrator privileges.

To verify the links:

```powershell
Get-Item "$PWD/proxy/.env"
Get-Item "$PWD/services/.env"
Get-Item "$PWD/monitoring/.env"
```

## Docker Compose

Once the symbolic links are created, each Compose project can be used normally:

```bash
cd proxy
docker compose up -d
```

```bash
cd services
docker compose up -d
```

```bash
cd monitoring
docker compose up -d
```

Docker Compose will find the `.env` file through the symbolic link, while the actual environment configuration remains centralized at the repository root.

## Benefits

* One source of truth for shared environment variables.
* No duplicated `BASE_URL` or other common settings.
* Each Compose directory can be used independently.
* `docker compose up` works without specifying `--env-file`.
* Updating the root `.env` automatically updates all projects.

