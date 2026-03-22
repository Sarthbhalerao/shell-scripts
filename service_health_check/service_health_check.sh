#!/bin/bash

set -euo pipefail

LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOGFILE="$LOG_DIR/health_$TIMESTAMP.log"

# logging Function

write_log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOGFILE"
}

# log File rotation function

rotate_logs() {
    find "$LOG_DIR" -type f -name "*.log" -mtime +7 -delete
}

# Run rotation early
rotate_logs

write_log "-------- Service Health check started --------"
echo ""

if [ "$#" -eq 0 ]; then
    write_log "No services provided. Usage: ./health_check.sh nginx docker"
    exit 1
fi

SERVICES=("$@")

RUNNING=0
NOT_RUNNING=0
NOT_FOUND=0

# check service status

for SERVICE in "${SERVICES[@]}"; do
    write_log "Checking service: $SERVICE"

    STATUS=$(systemctl is-active "$SERVICE" 2>/dev/null || echo "not-found")

	if [ "$STATUS" == "active" ]; then
		write_log "$SERVICE is running"
		RUNNING=$((RUNNING + 1))
	elif [ "$STATUS" == "inactive" ] || [ "$STATUS" == "failed" ]; then
		write_log "ALERT: $SERVICE is not running"
		NOT_RUNNING=$((NOT_RUNNING + 1))
	else
		write_log "WARNING: $SERVICE not found"
		NOT_FOUND=$((NOT_FOUND + 1))
	fi

    write_log "----------------------------------------"
echo ""
done

# check system uptime
echo ""

write_log "System uptime:"
echo ""
uptime | tee -a "$LOGFILE"

# print summary

echo ""

write_log "Summary: Running=$RUNNING | Not Running=$NOT_RUNNING | Not Found=$NOT_FOUND"

echo ""

write_log "-------- Health check completed --------"

