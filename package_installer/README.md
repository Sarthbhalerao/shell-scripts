# 📦 Multi-Package Installer

A robust Bash script to **install multiple packages efficiently** with support for both **interactive input** and **command-line arguments**, along with logging and safety checks.

---

## 📌 Overview

This script automates package installation on Debian-based systems using `apt-get`. It is designed to handle real-world scenarios by supporting:

* Multiple package installation
* Logging with timestamps
* Root privilege validation
* Flexible input methods (interactive + arguments)

---

## ⚙️ Features

* 📦 Install multiple packages in one command
* 🧠 Supports both interactive and argument-based input
* 📝 Logs all operations with timestamps
* 🔐 Ensures script runs with root privileges
* 🔄 Automatically updates package list before installation
* ⚡ Safe Bash practices (`set -euo pipefail`)

---

## 🛠️ Tech Stack

* Bash Scripting
* Linux (Debian/Ubuntu)
* APT Package Manager

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

All operations are logged in:

```id="c5y7sh"
install.log
```

Example log:

```id="u1u1k9"
2026-03-22 08:39:48 - Please run as root
2026-03-22 08:40:11 - Updating package list...
Hit:1 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble InRelease
Get:2 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
Get:3 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
Get:4 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1841 kB]
Get:5 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [177 kB]
Get:6 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1568 kB]
Get:7 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [386 kB]
Get:8 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]
Get:9 http://ap-south-1.ec2.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
```

---

## 🧠 How It Works

* If no arguments are passed → prompts user for input
* If arguments are provided → installs directly
* Checks if package is already installed using `dpkg -s`
* Updates package list before installation
* Logs every step with timestamps

---

## ⚠️ Requirements

* Debian-based system (Ubuntu, etc.)
* Root privileges
---

## 💡 Use Cases

* DevOps automation
* Server provisioning scripts
* CI/CD pipelines
* Local development setup

---

