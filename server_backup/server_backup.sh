#!/bin/bash

set -euo pipefail

# Input validation
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <backup_dir> <source1> <source2> ..."
    exit 1
fi

# Variables

BACKUP_DIR="$1"
shift
SOURCE_DIRS=("$@")

LOG_DIR="./logs"

mkdir -p "$BACKUP_DIR" "$LOG_DIR"

TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
LOGFILE="$LOG_DIR/backup_$TIMESTAMP.log"

RETENTION_DAYS=7

# Logging function

write_log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOGFILE" 2>/dev/null
}

# log rotation function

rotate_logs() {
    find "$LOG_DIR" -type f -name "*.log" -mtime +$RETENTION_DAYS -delete
}

# backup rotaion function

rotate_backups() {
    find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -delete
}

# call rotation functions

rotate_logs
rotate_backups

write_log "--------------- BACKUP STARTED ---------------"
echo ""

# Validate sources

VALID_SOURCES=()

for dir in "${SOURCE_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        VALID_SOURCES+=("$dir")
    else
        write_log "WARNING: $dir does not exist, skipping"
    fi
done

if [ "${#VALID_SOURCES[@]}" -eq 0 ]; then
    write_log "No valid directories to backup. Exiting."
    exit 1
fi

write_log "Creating backup: $BACKUP_FILE"

tar -czf "$BACKUP_FILE" "${VALID_SOURCES[@]}" >> "$LOGFILE" 2>&1

write_log "Backup created successfully at path $BACKUP_FILE"

SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
write_log "Backup size: $SIZE"

echo ""
write_log "--------------- BACKUP COMPLETED ---------------"
