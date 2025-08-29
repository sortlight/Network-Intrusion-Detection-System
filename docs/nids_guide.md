# NIDS Guide

## Overview
Detects network intrusions (port scans, high packet rates) using `scapy` and logs alerts.

## Scripts Explained

- **setup.sh**: Installs `scapy`, checks for `tcpdump`, sets permissions.
- **run_sniffer.sh**: Runs `nids.py` with sudo, logs output.
- **analyze_logs.sh**: Parses `alerts.log` for top IPs and alert counts.
- **simulate_attack.sh**: Uses `hping3` to simulate port scans.

## Usage

Run `setup.sh`, then `sudo run_sniffer.sh`. Use `simulate_attack.sh` to test, and `analyze_logs.sh` for insights.

# Author

Made by [Sortsec](https://github.com/sortlight)


