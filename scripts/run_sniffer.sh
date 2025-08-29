#!/bin/bash
# Runs nids.py with sudo for packet sniffing

echo "Starting NIDS sniffer..."
if [ "$EUID" -ne 0 ]; then
    echo "Error: Must run as root (use sudo)."
    exit 1
fi

python3 ../nids.py 2>&1 | tee -a ../logs/alerts.log
EOF
chmod +x run_sniffer.sh





# Written by Sortsec
