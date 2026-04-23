#!/usr/bin/env bash
BASE="192.168.0"
PORT=5000
MY_IP=$(hostname -I | awk '{print $1}')

echo "Network: $BASE.x  |  My IP: $MY_IP"
echo "For each message, enter the destination (last 3 digits) and your binary message."
echo ""

while true; do
    read -rp "to (last 3 digits)> " octet
    [[ -z "$octet" ]] && continue
    if [[ ! "$octet" =~ ^[0-9]{1,3}$ ]] || (( octet < 1 || octet > 254 )); then
        echo "  (enter the last 3 digits, 1-254)"
        continue
    fi
    DEST="$BASE.$octet"

    read -rp "send> " msg
    [[ -z "$msg" ]] && continue
    if [[ ! "$msg" =~ ^[01]+$ ]]; then
        echo "  (only 0s and 1s allowed)"
        continue
    fi
    ts=$(date '+%H:%M:%S')
    printf "\n[%s] %s:\n  %s\n\n" "$ts" "$MY_IP" "$msg" | nc -w1 "$DEST" "$PORT"
done
