# /bin/bash/sh

BASE_DIR="$(pwd)"

PROXY_COMPOSE="$BASE_DIR/proxy/compose.yml"
DATABASE_COMPOSE="$BASE_DIR/database/compose.yml"
SERVICES_COMPOSE="$BASE_DIR/services/compose.yml"
MONITORING_COMPOSE="$BASE_DIR/monitoring/compose.yml"

echo "=================================================="
echo "Starting ordered Homelab deployment"
echo "   Detected root: $BASE_DIR"
echo "=================================================="

echo "[1/4] Starting Database..."
docker compose -f "$DATABASE_COMPOSE" up

echo "[2/4] Starting Monitoring..."
docker compose -f "$MONITORING_COMPOSE" up

echo "[3/4] Starting Services..."
docker compose -f "$SERVICES_COMPOSE" up

echo "[4/4] Starting Proxy..."
docker compose -f "$PROXY_COMPOSE" up
