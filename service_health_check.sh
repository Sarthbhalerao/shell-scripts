#!/bin/bash

SERVICE="nginx"

echo "===== SERVER HEALTH CHECK ====="
echo ""

# Check Service Status
echo "Checking service status..."
STATUS=$(systemctl is-active $SERVICE)

if [ "$STATUS" == "active" ]; then
    echo "$SERVICE service is running"
else
    echo "$SERVICE service is NOT running"
fi

echo ""

# Check Disk Usage
echo "Checking disk usage..."
df -h /

echo ""

# Check System Uptime
echo "System uptime:"
uptime

echo ""
echo "===== CHECK COMPLETE ====="
