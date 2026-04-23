#!/usr/bin/env bash
PORT=5000
IP=$(hostname -I | awk '{print $1}')
echo "IP Address for this device: $IP. Listening on port $PORT..."
echo ""

while true; do
    nc -l "$PORT"
done
