#!/bin/bash

set -euo pipefail

LOGFILE="./install.log"

# Logging Function

write_log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOGFILE"
}

# Check if running as a root

if [ "$EUID" -ne 0 ]; then
    write_log "Please run as root"
    exit 1
fi

# Input handling
if [ "$#" -eq 0 ]; then
    read -p "Enter packages (space-separated): " -a packages
else
    packages=("$@")
fi

# Empty check
if [ "${#packages[@]}" -eq 0 ]; then
    write_log "No packages provided. Exiting."
    exit 1
fi

# Update packages before Installing

write_log "Updating package list..."
apt-get update -y >> "$LOGFILE" 2>&1

# Install packages

for pkg in "${packages[@]}"; do
    if dpkg -s "$pkg" &> /dev/null; then
        write_log "$pkg is already installed"
    else
        write_log "Installing $pkg..."
        apt-get install -y "$pkg" >> "$LOGFILE" 2>&1
    fi
done

write_log "Installation process completed."
