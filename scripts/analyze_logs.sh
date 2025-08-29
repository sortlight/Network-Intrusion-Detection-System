#!/bin/bash
# Inspired by log analysis in cybersecurity workflows

echo "Analyzing NIDS logs..."
LOG_FILE="../logs/alerts.log"
REPORT_FILE="../diagnostic_report.txt"
TIMESTAMP=$(date)
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found."
    exit 1
fi
echo "Log Analysis Report - $TIMESTAMP" > "$REPORT_FILE"
echo "Top IPs in alerts:" | tee -a "$REPORT_FILE"
grep "from" "$LOG_FILE" | awk '{print $6}' | sed 's/:$//' | sort | uniq -c | sort -nr | head -n 5 | tee -a "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Alert counts:" | tee -a "$REPORT_FILE"
grep -c "Port scan" "$LOG_FILE" | awk '{print "Port scans: " $1}' | tee -a "$REPORT_FILE"
grep -c "High packet rate" "$LOG_FILE" | awk '{print "High packet rates: " $1}' | tee -a "$REPORT_FILE"

echo "Analysis complete. See $REPORT_FILE."







## Made by Sortsec
