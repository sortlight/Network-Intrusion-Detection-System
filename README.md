<<<<<<< HEAD
# Network-Intrusion-Detection-System
NIDS you need 
=======
# IT Security Analyst: Network Intrusion Detection System

[![Bash](https://img.shields.io/badge/Bash-Scripting-green.svg)](https://www.gnu.org/software/bash/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Network threats like port scans or DDoS attacks can cripple systems fast. That’s why I built this **Network Intrusion Detection System (NIDS)**, a Python-based tool using `scapy` to sniff network packets, detect suspicious activity (for example port scans, high packet rates) and log alerts. Paired with Bash scripts for automation, it’s a hands-on demo of threat detection and response, inspired by tools like Snort and lessons from 2024’s major cyberattacks. This project showcases my Python and Bash skills, blending packet analysis with DevOps automation to make networks safer.

## Features

- **Packet Sniffing**: Uses `scapy` to monitor TCP/UDP traffic.
- **Intrusion Detection**: Flags port scans (multiple ports from one IP) and high packet rates.
- **Alert Logging**: Saves alerts to `logs/alerts.log` for analysis.
- **Bash Automation**:
  - `setup.sh`: Installs Python deps, checks tools (like tcpdump), sets permissions.
  - `run_sniffer.sh`: Runs `nids.py` with sudo, logs output.
  - `analyze_logs.sh`: Scans logs for patterns like frequent IPs.
  - `simulate_attack.sh`: Generates mock malicious traffic like port scans for testing.

- **Output**: Detailed alerts in `logs/alerts.log`.

## Workflow

1. **Setup**: `setup.sh` installs `scapy`, checks for `tcpdump` and preps the environment.
2. **Sniffing**: `nids.py` captures packets, detects anomalies like  >10 ports scanned in 10s and logs alerts.
3. **Automation**: `run_sniffer.sh` runs the sniffer with proper permissions; `analyze_logs.sh` parses logs for insights.
4. **Testing**: `simulate_attack.sh` sends mock traffic to trigger alerts.
5. **Extensibility**: Add rules like SQL injection patterns or integrate with SIEM tools.

## Lets get into it 

### Prerequisites
- Linux (for `scapy` and `tcpdump`)
- Python 3.8+
- Bash, sudo access (for packet sniffing)
- curl, tcpdump (install via `sudo apt install curl tcpdump`)

### Install

   ```bash
   git clone https://github.com/yourusername/network-intrusion-detection-system.git
   cd network-intrusion-detection-system

    ```
# NIDS
>>>>>>> d7fa230 (NIDS)
