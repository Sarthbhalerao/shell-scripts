# 🗄️ Server Backup Script

A production-style Bash script to **backup multiple directories**, generate **compressed archives**, and maintain **log and backup retention** - automatically.

---

## 📌 Overview

This script automates server backups by compressing specified directories into a `.tar.gz` archive. It includes **timestamp-based logging**, **input validation**, and **automatic cleanup of old backups and logs**.

---

## ⚙️ Features

- Backup multiple directories in one run
- Accepts backup directory and source directories as arguments
- Compresses backups into `.tar.gz` format
- Timestamp-based logging
- Automatic log file creation
- Log rotation (removes logs older than 7 days)
- Backup rotation (removes old backups)
- Safe Bash practices (`set -euo pipefail`)
- Validates source directories before backup

---

## 🚀 How to Use

### 1️⃣ Make script executable

```bash
chmod +x server_backup.sh
```

---

### 2️⃣ Run the script

```bash
./server_backup.sh <backup_dir> <source1> <source2> ...
```

---

### 📌 Example

```bash
./server_backup.sh /home/ubuntu/backup /etc /var/www /home/ubuntu
```

---

## 📊 Sample Output

```
2026-03-22 11:05:46 - --------------- BACKUP STARTED ---------------
2026-03-22 11:05:46 - Creating backup: /home/ubuntu/backup/backup_2026-03-22_11-05-46.tar.gz
tar: Removing leading `/' from member names
2026-03-22 11:05:46 - Backup created successfully at path /home/ubuntu/backup/backup_2026-03-22_11-05-46.tar.gz
2026-03-22 11:05:46 - Backup size: 72K
2026-03-22 11:05:46 - --------------- BACKUP COMPLETED ---------------
```

---

## 📝 Logging

- Logs are stored in:

```bash
./logs/
```

- Each execution creates a new log file:

```bash
logs/backup_YYYY-MM-DD_HH-MM-SS.log
```

---

## 🧹 Log Rotation

Old logs are automatically deleted:

```bash
find logs/ -type f -name "*.log" -mtime +7 -delete
```

---

## ♻️ Backup Rotation

Old backup files are automatically removed:

```bash
find <backup_dir>/ -type f -name "*.tar.gz" -mtime +7 -delete
```

---

## 🧠 How It Works

- Takes backup directory as first argument
- Uses `shift` to separate source directories
- Validates each source directory
- Compresses valid directories into a `.tar.gz` file
- Logs all operations with timestamps
- Removes old logs and backups automatically

---

## ⚠️ Requirements

- Linux system (Ubuntu/Debian recommended)
- Bash shell
- Sufficient disk space for backups

---

## 💡 Use Cases

- Server backup automation
- DevOps learning projects
- Scheduled backups using cron
- Disaster recovery preparation

---

