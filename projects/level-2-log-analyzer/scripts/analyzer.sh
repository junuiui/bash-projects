#!/bin/bash

# Set up log file

LOG_FILE=$1
# Default 파일 경로 설정
LOG_FILE=${1:-"../logs/access.log"}

# 1. 파일 존재 여부 확인 (Defensive)
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found."
    exit 1
fi

echo "=========================================="
echo "          Log Analysis Report             "
echo "=========================================="

# Top 3 
# awk '{print $1}' "$LOG_FILE"      Extracts only the first column (IP addresses) from the log file.
# sort  Alphabetically groups identical IP addresses together so uniq can process them
# uniq -c   Collapses duplicate lines and prefixes each line with the number of occurrences (count).
# sort -nr  Sorts the results numerically in reverse order (highest count at the top).
# head -n 3 Limits the output to only the top 3 rows.
echo "[1. Top 3 IP Addresses]"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 3
echo ""

# 3. HTTP 상태 코드별 발생 횟수 (Health Check)
echo "[2. Status Code Summary]"
awk '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr
echo ""

echo "=========================================="

exit 0