#!/bin/bash
echo "Setting up Network Intrusion Detection System..."

for cmd in curl tcpdump; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: $cmd not found. Install with: sudo apt install $cmd"
        exit 1
    fi
done

if ! command -v python3 &> /dev/null; then
    echo "Error: Python3 not found. Install with: sudo apt install python3"
    exit 1
fi
echo "Installing Python dependencies..."
pip3 install -r ../requirements.txt || { echo "Pip install failed! Try using a virtual environment: python3 -m venv venv && source venv/bin/activate && pip install -r ../requirements.txt"; exit 1; }

chmod +x run_sniffer.sh analyze_logs.sh simulate_attack.sh
echo "Scripts set as executable."
echo "Setup complete! Run 'sudo ./scripts/run_sniffer.sh' to start."
EOF
chmod +x setup.sh

# Written by Sortsec
