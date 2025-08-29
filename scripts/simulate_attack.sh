#!/bin/bash
echo "Simulating port scan attack..."
if ! command -v hping3 &> /dev/null; then
    echo "Error: hping3 not found. Install with: sudo apt install hping3"
    exit 1
fi
TARGET="localhost"
PORTS=(80 22 443 8080 3306)
COUNT=20
for port in "${PORTS[@]}"; do
    echo "Sending packets to $TARGET:$port..."
    sudo hping3 -c $COUNT -S -p $port $TARGET 2>/dev/null
    sleep 0.5
done
echo "Attack simulation complete. Check logs/alerts.log for detections."
chmod +x simulate_attack.sh


# Made by Sortsec
