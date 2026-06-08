#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://localhost}"

echo "Checking BataraSec Community at ${BASE_URL}"
curl -fsS "${BASE_URL}/api/health" >/dev/null
echo "OK: API health endpoint responded"
