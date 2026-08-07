# /bin/bash/sh

BASE_DIR="$(pwd)"

PROXY_COMPOSE="$BASE_DIR/proxy/compose.yml"
DATABASE_COMPOSE="$BASE_DIR/database/compose.yml"
SERVICES_COMPOSE="$BASE_DIR/services/compose.yml"

echo "=================================================="
echo "Stopping Homelab infrastructure in reverse order"
echo "   Detected root: $BASE_DIR"
echo "=================================================="

echo "[1/3] Stopping Proxy..."
docker compose -f "$PROXY_COMPOSE" down

echo "[2/3] Stopping Services..."
docker compose -f "$SERVICES_COMPOSE" down

echo "[3/3] Stopping Database..."
docker compose -f "$DATABASE_COMPOSE" down

echo "=================================================="
echo "All infrastructure successfully stopped"
echo "=================================================="
