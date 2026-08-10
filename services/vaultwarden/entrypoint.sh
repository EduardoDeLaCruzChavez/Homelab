#!/bin/sh
set -e

DB_PASSWORD="$(cat /run/secrets/vaultwarden_db_password)"

export DATABASE_URL="postgresql://vaultwarden:${DB_PASSWORD}@postgres:5432/vaultwarden"

exec /start.sh
