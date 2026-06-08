#!/usr/bin/env bash
set -euo pipefail

# BataraSec Community installer (draft)
# This installer is intentionally small and Community-only.

INSTALL_DIR="${BATARASEC_INSTALL_DIR:-/opt/batarasec-community}"
VERSION="${BATARASEC_VERSION:-0.1.0-community}"
HTTP_PORT="${HTTP_PORT:-8088}"

random_hex() {
  openssl rand -hex 32
}

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "[ERROR] Required command not found: $1" >&2
    exit 1
  fi
}

echo "BataraSec Community installer"
echo "Version: ${VERSION}"
echo "Install dir: ${INSTALL_DIR}"
echo

require_cmd docker
if ! docker compose version >/dev/null 2>&1; then
  echo "[ERROR] Docker Compose plugin is required." >&2
  exit 1
fi
require_cmd openssl

if [ "$(id -u)" -ne 0 ]; then
  echo "[ERROR] Please run as root or with sudo." >&2
  exit 1
fi

mkdir -p "${INSTALL_DIR}"
cp docker-compose.yml "${INSTALL_DIR}/docker-compose.yml"
mkdir -p "${INSTALL_DIR}/nginx"
cp -r nginx/. "${INSTALL_DIR}/nginx/"

if [ ! -f "${INSTALL_DIR}/.env" ]; then
  POSTGRES_PASSWORD="$(random_hex)"
  JWT_SECRET="$(random_hex)"
  LICENSE_SECRET="$(random_hex)"
  SETTINGS_ENCRYPTION_KEY="$(random_hex)"
  SUPERADMIN_PASSWORD="$(openssl rand -base64 18 | tr -d '\n')"

  cp .env.example "${INSTALL_DIR}/.env"
  sed -i "s/^BATARASEC_VERSION=.*/BATARASEC_VERSION=${VERSION}/" "${INSTALL_DIR}/.env"
  sed -i "s/^POSTGRES_PASSWORD=.*/POSTGRES_PASSWORD=${POSTGRES_PASSWORD}/" "${INSTALL_DIR}/.env"
  sed -i "s#^DATABASE_URL=.*#DATABASE_URL=postgresql://batarasec:${POSTGRES_PASSWORD}@postgres:5432/batarasec#" "${INSTALL_DIR}/.env"
  sed -i "s/^JWT_SECRET=.*/JWT_SECRET=${JWT_SECRET}/" "${INSTALL_DIR}/.env"
  sed -i "s/^LICENSE_SECRET=.*/LICENSE_SECRET=${LICENSE_SECRET}/" "${INSTALL_DIR}/.env"
  sed -i "s/^SETTINGS_ENCRYPTION_KEY=.*/SETTINGS_ENCRYPTION_KEY=${SETTINGS_ENCRYPTION_KEY}/" "${INSTALL_DIR}/.env"
  sed -i "s/^SUPERADMIN_PASSWORD=.*/SUPERADMIN_PASSWORD=${SUPERADMIN_PASSWORD}/" "${INSTALL_DIR}/.env"
  chmod 600 "${INSTALL_DIR}/.env"
else
  echo "[INFO] Existing ${INSTALL_DIR}/.env found; preserving it."
fi

cd "${INSTALL_DIR}"
docker compose pull
docker compose up -d

echo
echo "[OK] BataraSec Community is starting."
echo "URL: http://localhost:${HTTP_PORT}"
echo "Install dir: ${INSTALL_DIR}"
echo
if grep -q '^SUPERADMIN_PASSWORD=' .env; then
  echo "Superadmin username: superadmin"
  echo "Superadmin password: $(grep '^SUPERADMIN_PASSWORD=' .env | cut -d= -f2-)"
fi

echo
echo "Check health: docker compose ps"
echo "Logs: cd ${INSTALL_DIR} && docker compose logs -f"
