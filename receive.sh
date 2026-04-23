#!/usr/bin/env bash
PORT=5000
echo "Listening on port $PORT... Ctrl+C to quit."
echo ""

while true; do
    nc -l "$PORT"
done
