#!/bin/bash

<<usage
Create system_info.sh that uses functions for everything:
1. A function to print **hostname and OS info**
2. A function to print **uptime**
3. A function to print **disk usage** (top 5 by size)
4. A function to print **memory usage**
5. A function to print **top 5 CPU-consuming processes**
6. A main function that calls all of the above with section headers
7. Use set -euo pipefail at the top
usage

set -euo pipefail

print_header() {
    echo "----------------------------------------------------------------------------------------"
    echo "$1"
    echo "----------------------------------------------------------------------------------------"
}

system_info() {
    print_header "System Information"
    hostname
    cat /etc/os-release
}

uptime_info() {
    print_header "System Uptime"
    uptime
}

disk_usage() {
    print_header "Top Disk Usage"
    du -h / 2>/dev/null | sort -rh | head -5 || true
}

memory_usage() {
    print_header "Memory Usage"
    free -h
}

top_processes() {
    print_header "Top CPU Processes"
    ps aux --sort=-%cpu | head -5
}

main() {
    system_info
    uptime_info
    disk_usage
    memory_usage
    top_processes
}

main


