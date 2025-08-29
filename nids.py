from scapy.all import sniff, IP, TCP, UDP
import time
import logging
from collections import defaultdict

logging.basicConfig(filename='../logs/alerts.log', level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

packet_counts = defaultdict(int)
port_scans = defaultdict(set)
start_time = time.time()

def detect_intrusion(packet):
    """Analyze packets for suspicious activity."""
    if packet.haslayer(IP):
        src_ip = packet[IP].src
        packet_counts[src_ip] += 1
        current_time = time.time()

        if current_time - start_time > 10:
            for ip, count in list(packet_counts.items()):
                if count > 100:
                    logging.warning(f"High packet rate from {ip}: {count} packets")
            packet_counts.clear()
            globals()['start_time'] = current_time
        if packet.haslayer(TCP):
            port = packet[TCP].dport
            port_scans[src_ip].add(port)
            if len(port_scans[src_ip]) > 10:
                logging.warning(f"Port scan detected from {ip}: {len(port_scans[src_ip])} ports")
                port_scans[src_ip].clear()

def main():
    """Start packet sniffing."""
    print("Starting NIDS... Press Ctrl+C to stop.")
    try:
        sniff(filter="tcp or udp", iface="lo", prn=detect_intrusion, store=0)  # Use 'lo' for localhost
    except KeyboardInterrupt:
        print("Stopped sniffing.")
    except Exception as e:
        logging.error(f"Error: {e}")

if __name__ == "__main__":
    main()
