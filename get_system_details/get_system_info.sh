#!/bin/bash

set -euo pipefail

# Create logs directory

LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

# Timestamped logfile

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOGFILE="$LOG_DIR/system_info_$TIMESTAMP.log"

# Logging function

write_log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOGFILE"
}

# Log rotation (delete logs older than 7 days)
rotate_logs() {
    find "$LOG_DIR" -type f -name "*.log" -mtime +7 -delete
}

# Run rotation early
rotate_logs

# Header function
print_header() {
    write_log "------------------------------------------------------------"
    write_log "$1"
    write_log "------------------------------------------------------------"
}

# get system info

system_info() {
    print_header "System Information"
    write_log "Hostname: $(hostname)"
    grep -E '^(NAME|VERSION)=' /etc/os-release | tee -a "$LOGFILE"
    echo ""
}

# get system Uptime

uptime_info() {
    print_header "System Uptime"
    uptime | tee -a "$LOGFILE"
    echo ""
}

# get Disk usage

disk_usage() {
    print_header "Disk Usage"
    df -h | tee -a "$LOGFILE"
    echo ""
}

# get memory usage

memory_usage() {
    print_header "Memory Usage"
    free -h | tee -a "$LOGFILE"
    echo ""
}

# Top 6 CPU consuming processes

top_processes() {
    print_header "Top CPU Processes"
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -6 | tee -a "$LOGFILE"
    echo ""
}

# Main function

main() {
    write_log "--------- SYSTEM INFORMATION REPORT ---------"
    system_info
    uptime_info
    disk_usage
    memory_usage
    top_processes
    write_log "---------REPORT COMPLETE ---------"
}

main
