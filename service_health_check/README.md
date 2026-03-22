# 🩺 Service Health Check Script

A production-style Bash script to **monitor multiple services**, generate **timestamped logs**, and perform **automatic log rotation**.

---

## 📌 Overview

This script checks the status of multiple system services using `systemctl`, logs the results with timestamps, and maintains log hygiene by removing old log files.

It is designed to simulate **real-world DevOps monitoring tasks**.

---

## ⚙️ Features

- Monitor multiple services at once
- Accept service names as command-line arguments
- Timestamp-based logging
- Automatic log file creation
- Log rotation (deletes logs older than 7 days)
- Summary report (Running / Not Running / Not Found)
- Safe Bash practices (`set -euo pipefail`)

---

## 🚀 How to Use

### 1️⃣ Make script executable

```bash
chmod +x service_health_check.sh
```

---

### 2️⃣ Run the script

```bash
./service_health_check.sh nginx docker ssh
```

---

### ⚠️ If no arguments are passed

```bash
./service_health_check.sh
```

Output:

```
No services provided. Usage: ./health_check.sh nginx docker
```

---

## 📊 Sample Output

```
2026-03-22 09:07:13 - -------- Service Health check started --------

2026-03-22 09:07:13 - Checking service: nginx
2026-03-22 09:07:13 - nginx is running
----------------------------------------

2026-03-22 09:07:13 - Checking service: docker
2026-03-22 09:07:13 - ALERT: docker is not running
----------------------------------------

2026-03-22 09:07:13 - System uptime:
 09:07:13 up 2 days,  4:21,  1 user

2026-03-22 09:07:13 - Summary: Running=1 | Not Running=1 | Not Found=0

2026-03-22 09:07:13 - -------- Health check completed --------
```

---

## 📝 Logging

* Logs are stored in:

```bash
./logs/
```

* Each run generates a new file:

```bash
health_YYYY-MM-DD_HH-MM-SS.log
```

---

## 🧹 Log Rotation

The script automatically deletes log files older than **7 days**:

```bash
find logs/ -mtime +7 -delete
```

---

## 🧠 How It Works

- Takes service names as input arguments
- Uses `systemctl is-active` to check status
- Categorizes services into:

  - Running ✅
  - Not Running ❌
  - Not Found ⚠️
- Logs all actions with timestamps
- Generates a final summary

---

## 💡 Use Cases

- Server health monitoring
- DevOps practice projects
- Automated system checks via cron
- Infrastructure troubleshooting

---
