# /bin/bash/sh

BASE_DIR="$(pwd)"

PROXY_COMPOSE="$BASE_DIR/proxy/compose.yml"
DATABASE_COMPOSE="$BASE_DIR/database/compose.yml"
SERVICES_COMPOSE="$BASE_DIR/services/compose.yml"

echo "=================================================="
echo "Starting ordered Homelab deployment"
echo "   Detected root: $BASE_DIR"
echo "=================================================="

echo "[1/3] Starting Database..."
docker compose -f "$DATABASE_COMPOSE" up

echo "[2/3] Starting Services..."
docker compose -f "$SERVICES_COMPOSE" up

echo "[3/3] Starting Proxy..."
docker compose -f "$PROXY_COMPOSE" up
