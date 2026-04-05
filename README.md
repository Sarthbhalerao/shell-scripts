# 🐚 Shell Scripts Collection (DevOps Automation Toolkit)

A curated collection of **production-oriented Bash scripts** built as part of my hands-on DevOps journey 🚀

This repository focuses on **real-world automation use cases** like log analysis, system monitoring, backups, and service health checks — designed with **robust error handling, logging, and maintainability in mind**.

---

## 📌 About This Repository

This is more than a practice repo — it's a **DevOps automation playground** where I:

* Build **end-to-end automation workflows**
* Solve **real operational problems**
* Follow **best practices (logging, validation, idempotency)**
* Continuously improve scripts towards **production readiness**

---

## 📂 Project Structure & Scripts

### 🔍 Log Analyzer & Report Generator

**Directory:** `Log_Analyzer_and_Report_Generator/`

Includes:

* `sample_log_generator.sh` → Generates synthetic logs for testing
* `log_analyzer.sh` → Parses logs and generates reports

**Features:**

* Extracts `ERROR`, `CRITICAL`, and failure patterns
* Identifies **top recurring errors**
* Generates a **timestamped report file**
* Automatically archives processed logs

---

### 🖥 System Information Collector

**Directory:** `get_system_details/`

**Features:**

* Captures system metadata (OS, hostname)
* Displays:

  * Uptime
  * Disk usage
  * Memory usage
  * Top CPU processes
* Implements **log rotation (7-day retention)**

---

### 📦 Advanced Package Installer

**Directory:** `package_installer/`

**Features:**

* Installs packages via `apt`
* Prevents duplicate installations
* Supports:

  * CLI arguments
  * Interactive input
* Includes:

  * Root user validation
  * Logging with timestamps
  * Pre-install update (`apt-get update`)

---

### 💾 Server Backup & Retention Manager

**Directory:** `server_backup/`

**Features:**

* Creates compressed backups (`.tar.gz`)
* Supports multiple source directories
* Implements:

  * Backup validation
  * Logging
  * **Retention policy (auto-delete old backups)**
* Displays backup size

---

### ❤️ Service Health Check Script

**Directory:** `service_health_check/`

**Features:**

* Checks status of multiple services
* Categorizes:

  * Running
  * Not Running
  * Not Found
* Provides:

  * Summary report
  * System uptime
  * Structured logs

---

## 🎯 Key Highlights

* ✅ Modular and reusable Bash functions
* ✅ Strong input validation & error handling (`set -euo pipefail`)
* ✅ Centralized logging with timestamps
* ✅ Log & backup rotation mechanisms
* ✅ Real-world DevOps use cases

---

## 🛠 Tech Stack

* **Bash / Shell Scripting**
* **Linux System Administration**
* Core utilities:

  * `grep`, `sed`, `awk`
  * `tar`, `df`, `free`, `uptime`
  * `systemctl`, `ps`

---

## ▶️ Getting Started

```bash
git clone https://github.com/Sarthbhalerao/shell-scripts.git
cd shell-scripts
chmod +x */*.sh
```

Run any script:

```bash
./server_backup/server_backup.sh /backup /home /var/log
```

---

## 📈 Future Improvements

* Add **cron job automation examples**
* Export reports in **JSON format for monitoring tools**
* Integrate with **monitoring systems (Datadog / Prometheus)**
* Add **alerting (email / Slack notifications)**
* Convert scripts into a **CLI toolkit**
* Add **unit testing for scripts (bats framework)**

---

## 🤝 Contributions

This is a learning-driven repository, but improvements, suggestions, and ideas are always welcome!

---

## 📬 Connect With Me

LinkedIn: [Sarthak Bhalerao](https://linkedin.com/in/sarthak-bhalerao)
