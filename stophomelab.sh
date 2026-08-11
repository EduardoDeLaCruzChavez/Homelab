# /bin/bash/sh

BASE_DIR="$(pwd)"

PROXY_COMPOSE="$BASE_DIR/proxy/compose.yml"
DATABASE_COMPOSE="$BASE_DIR/database/compose.yml"
SERVICES_COMPOSE="$BASE_DIR/services/compose.yml"
MONITORING_COMPOSE="$BASE_DIR/monitoring/compose.yml"

echo "=================================================="
echo "Stopping Homelab infrastructure in reverse order"
echo "   Detected root: $BASE_DIR"
echo "=================================================="

echo "[1/4] Stopping Proxy..."
docker compose -f "$PROXY_COMPOSE" down

echo "[2/4] Stopping Services..."
docker compose -f "$SERVICES_COMPOSE" down

echo "[2/4] Stopping Monitoring..."
docker compose -f "$MONITORING_COMPOSE" down

echo "[3/4] Stopping Database..."
docker compose -f "$DATABASE_COMPOSE" down

echo "=================================================="
echo "All infrastructure successfully stopped"
echo "=================================================="
