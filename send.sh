#!/usr/bin/env bash
DEST="${1:-10.0.0.2}"
PORT=5000
MY_IP=$(ip -4 addr show enp8s0 | awk '/inet/{print $2}' | cut -d/ -f1)

echo "Sending to $DEST as $MY_IP. Type 0s and 1s, then Enter. Ctrl+C to quit."
echo ""

while true; do
    read -rp "send> " msg
    [[ -z "$msg" ]] && continue
    if [[ ! "$msg" =~ ^[01]+$ ]]; then
        echo "  (only 0s and 1s allowed)"
        continue
    fi
    ts=$(date '+%H:%M:%S')
    printf "\n[%s] %s:\n  %s\n\n" "$ts" "$MY_IP" "$msg" | nc -w1 "$DEST" "$PORT"
done
