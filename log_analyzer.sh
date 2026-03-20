#!/bin/bash

# check the input is given or not

if [ $# -eq 0 ]; then
    echo "Please provide the log file path as input."
    exit 1
fi

LOG_FILE=$1

# check provided log file exists or not

if [ ! -f "$LOG_FILE" ]; then
    echo "ERROR: Log file $LOG_FILE does not exist."
    exit 1
fi

# Count total errors

ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOG_FILE" | wc -l)

echo "Total Errors: $ERROR_COUNT"

DATE=$(date +%Y-%m-%d)
REPORT_FILE="log_report_$DATE.txt"

TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" \
    | sed 's/^[^ ]* [^ ]* [^ ]* //' \
    | sort \
    | uniq -c \
    | sort -rn \
    | head -5)

# output to the console

echo "Total Errors: $ERROR_COUNT"
echo ""
echo "----- TOP 5 ERROR MESSAGES -----"
echo "$TOP_ERRORS"
echo ""
echo "----- CRITICAL EVENTS -----"
grep -n "CRITICAL" "$LOG_FILE"

{
echo "----- Log Analysis Report -----"
echo "Date: $(date)"
echo "Log File: $LOG_FILE"
echo "Total Lines: $(wc -l < "$LOG_FILE")"
echo "Total Errors: $ERROR_COUNT"

echo ""
echo "----- Top 5 Errors -----"
echo "$TOP_ERRORS"

echo ""
echo "----- Critical Events -----"
grep -n "CRITICAL" "$LOG_FILE"

} > "$REPORT_FILE"

echo ""
echo "Report generated: $REPORT_FILE"

# Archive

mkdir -p archive
mv "$LOG_FILE" archive/

echo "Log file archived successfully."

