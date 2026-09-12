#!/bin/bash
set -euo pipefail

# Check if the user passed an argument ($1)
if [ -z "${1:-}" ]; then
  echo "Usage: $0 <port_number>"
  exit 1
fi

PORT="$1"
echo "Checking if port $PORT is currently listening..."

if ss -tulpn | grep -q ":$PORT "; then
  echo "Status: Port $PORT is OPEN and listening."
  exit 0
else
  echo "Status: Port $PORT is NOT listening."
  exit 1
fi
