# 📦 Multi-Package Installer

A robust Bash script to **install multiple packages efficiently** - with support for both **interactive input*- and **command-line arguments**, along with advanced logging and safety checks.

---

## 📌 Overview

This script automates package installation on Debian-based systems using `apt-get`. It is designed to handle real-world scenarios by supporting:

- Multiple package installation
- Timestamp-based logging
- Automatic log file creation
- Log rotation for old files
- Root privilege validation
- Flexible input methods (interactive + arguments)

---

## ⚙️ Features

- Install multiple packages in one command
- Supports both interactive and argument-based input
- Logs all operations with timestamps
- Automatically creates log files with timestamps
- Log rotation (removes logs older than 7 days)
- Ensures script runs with root privileges
- Automatically updates package list before installation
- Safe Bash practices (`set -euo pipefail`)

---

## 🛠️ Tech Stack

- Bash Scripting
- Linux (Debian/Ubuntu)
- APT Package Manager

---

## 🚀 How to Use

### 1️⃣ Make script executable

```bash
chmod +x install.sh
```

---

### 2️⃣ Run in Interactive Mode

```bash
sudo ./install.sh
```

Then enter packages:

```
nginx git curl
```

---

### 3️⃣ Run in Argument Mode (Recommended)

```bash
sudo ./install.sh nginx git curl docker.io
```

---

## 📊 Logging

- Logs are stored in:

```
./logs/
```

- Each execution creates a new timestamped log file:

```
logs/install_YYYY-MM-DD_HH-MM-SS.log
```

---

### 🧾 Sample Log

```
2026-03-22 09:42:49 - -------- Package Installation Started --------
2026-03-22 09:42:49 - Updating package list...
Hit:1 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble InRelease
Hit:2 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:3 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu noble-security InRelease
Reading package lists...
2026-03-22 09:42:52 - nginx is already installed
2026-03-22 09:42:52 - docker.io is already installed
2026-03-22 09:42:52 - Installation process completed.
```

---

## 🧹 Log Rotation

Old log files are automatically removed:

```bash
find logs/ -type f -name "*.log" -mtime +7 -delete
```

- Removes logs older than **7 days**
- Keeps log directory clean and manageable

---

## 🧠 How It Works

- If no arguments are passed → prompts user for input
- If arguments are provided → installs directly
- Checks if package is already installed using `dpkg -s`
- Updates package list before installation
- Creates a new timestamped log file for each run
- Deletes old logs automatically (7-day retention)

---

## ⚠️ Requirements

- Debian-based system (Ubuntu, etc.)
- Root privileges

---

## 💡 Use Cases

- DevOps automation
- Server provisioning scripts
- CI/CD pipelines
- Local development setup

---

