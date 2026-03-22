# 🖥️ Get System Information

A structured Bash script that generates a **detailed system information report** - including system details, resource usage, and top processes, with **timestamped logging*- and **automatic log rotation**.

---

## 📌 Overview

This script collects and logs essential system metrics to help monitor system health and performance. It is designed with modular functions and follows best practices for **logging, error handling, and automation**.

---

## ⚙️ Features

- Displays hostname and OS information
- Shows system uptime
- Reports disk usage
- Displays memory usage
- Lists top CPU-consuming processes
- Timestamp-based logging for every run
- Automatic log file creation
- Log rotation (removes logs older than 7 days)
- Safe Bash practices (`set -euo pipefail`)
- Modular function-based design


---

## 🚀 How to Use

### 1️⃣ Make script executable

```bash
chmod +x system_info.sh
```

---

### 2️⃣ Run the script

```bash
./system_info.sh
```

---

## 📊 Sample Output

```
2026-03-22 10:15:33 - --------- SYSTEM INFORMATION REPORT ---------
2026-03-22 10:15:33 - ------------------------------------------------------------
2026-03-22 10:15:33 - System Information
2026-03-22 10:15:33 - ------------------------------------------------------------
2026-03-22 10:15:33 - Hostname: ip-172-31-42-78
NAME="Ubuntu"
VERSION="24.04.3 LTS (Noble Numbat)"
2026-03-22 10:15:33 - ------------------------------------------------------------
2026-03-22 10:15:33 - System Uptime
2026-03-22 10:15:33 - ------------------------------------------------------------
 10:15:33 up  2:16,  4 users,  load average: 0.00, 0.00, 0.00
2026-03-22 10:15:33 - ------------------------------------------------------------
2026-03-22 10:15:33 - Disk Usage
2026-03-22 10:15:33 - ------------------------------------------------------------
Filesystem       Size  Used Avail Use% Mounted on
/dev/root         19G  4.5G   14G  25% /
tmpfs            456M     0  456M   0% /dev/shm
tmpfs            183M  964K  182M   1% /run
tmpfs            5.0M     0  5.0M   0% /run/lock
efivarfs         128K  4.4K  119K   4% /sys/firmware/efi/efivars
/dev/nvme0n1p16  881M  162M  657M  20% /boot
/dev/nvme0n1p15  105M  6.2M   99M   6% /boot/efi
tmpfs             92M   12K   92M   1% /run/user/1000
2026-03-22 10:15:33 - ------------------------------------------------------------
2026-03-22 10:15:33 - Memory Usage
2026-03-22 10:15:33 - ------------------------------------------------------------
               total        used        free      shared  buff/cache   available
Mem:           911Mi       492Mi        88Mi       2.8Mi       535Mi       419Mi
Swap:             0B          0B          0B
2026-03-22 10:15:33 - ------------------------------------------------------------
2026-03-22 10:15:33 - Top CPU Processes
2026-03-22 10:15:33 - ------------------------------------------------------------
    PID COMMAND         %CPU %MEM
   8905 get_system_info 16.6  0.3
   7257 sshd             0.1  0.7
   5712 sshd             0.0  0.7
    571 snapd            0.0  2.1
    644 containerd       0.0  2.8
2026-03-22 10:15:33 - ---------REPORT COMPLETE ---------
```

---

## 📝 Logging

- Logs are stored in:

```bash
./logs/
```

- Each execution creates a new timestamped log file:

```bash
logs/system_info_YYYY-MM-DD_HH-MM-SS.log
```

---

## 🧹 Log Rotation

The script automatically removes old logs:

```bash
find logs/ -type f -name "*.log" -mtime +7 -delete
```

- Deletes logs older than **7 days**
- Keeps the log directory clean and manageable

---

## 🧠 How It Works

- Creates a `logs/` directory if it does not exist
- Generates a new timestamped log file for each run
- Uses modular functions for each system metric
- Logs all output using a centralized logging function
- Removes old logs automatically before execution

---

## ⚠️ Requirements

- Linux system (Ubuntu/Debian recommended)
- Bash shell

---

## 💡 Use Cases

- System monitoring and diagnostics
- DevOps learning projects
- Server health reporting
- Automation with cron jobs

---

