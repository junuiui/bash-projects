#!/bin/bash

# Evaluate the input threshold
if [ -z "$1" ] || [ "$1" -gt 100 ] || [ "$1" -lt 0 ] || [ "$#" -gt 1 ]; then
    echo "Usage: [filename].sh [0 < threshold < 100]"
    exit 1
fi

# df -h /           => disk free ( / = root)
# grep /            => show with /
# awk '{print $5}'  => show 5th column
# sed 's/%//g'      => substitude % with empty char
CURRENT_USAGE=$(df -h / | grep / | awk '{print $5}' | sed 's/%//g')

if [ "$CURRENT_USAGE" -gt $1 ]; then
    STATUS="CRITICAL"
else
    STATUS="OK"
fi

LOG_PATH="../logs/disk_usage.log"

echo "[$(date)] STATUS: $STATUS | Usage: $CURRENT_USAGE%" >> $LOG_PATH