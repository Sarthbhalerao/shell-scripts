# 📊 Log Analyzer & Report Generator (Bash)

## 🚀 Overview
This project is a Bash-based log analyzer that processes system log files, extracts key insights, and generates a structured summary report.

It simulates real-world DevOps scenarios where engineers analyze logs for errors, failures, and critical system events.

---

## 🛠️ Features

- Input validation for log file  
- Count total errors (`ERROR`, `Failed`)  
- Identify critical events with line numbers  
- Extract top 5 most frequent error messages  
- Generate daily summary report  
- Archive processed logs (optional)  

---

## 📁 Project Structure

day-20/

├── log_analyzer.sh

├── generate_logs.sh

├── sample_log.log

├── archive/

└── log_report_2026-03-20.txt 

---


---

## ⚙️ How It Works

### 1. Input Validation
- Ensures log file path is provided  
- Checks if file exists  

### 2. Error Analysis
- Counts lines containing `ERROR` or `Failed`  

### 3. Critical Events
- Extracts `CRITICAL` logs with line numbers  

### 4. Top Errors
- Removes timestamps  
- Groups identical messages  
- Displays top 5 most frequent errors  

### 5. Report Generation
Creates a report file: log_report_2026-03-20.txt 


---

## ▶️ Usage

### Step 1: Generate Sample Logs

```
chmod +x generate_logs.sh
./generate_logs.sh
```
### Step 2: Run Analyzer

```
chmod +x log_analyzer.sh
./log_analyzer.sh sample_log.log
```
---

## Using Real-World Log Data (Recommended)

- You can test this script with production-like datasets from LogHub: https://github.com/logpai/loghub

**Examples:**

- ZooKeeper logs

- Hadoop (HDFS) logs
---

## 📄 Sample Output

<img width="1362" height="979" alt="image" src="https://github.com/user-attachments/assets/77ffce4c-a6d3-4727-82e8-714d4bf64b41" />

---

## Sample Report

<img width="1580" height="977" alt="image" src="https://github.com/user-attachments/assets/c6cd24bf-f32f-4a07-ab96-11d33ed61c2e" />

---

## Commands Used

## Input & Validation
- `$1` → first command-line argument (log file input)  
- `[ -f file ]` → checks if a file exists  
- `exit 1` → exits the script with an error status  

---

## Log Analysis
- `grep "ERROR" logfile` → searches for lines containing "ERROR"  
- `grep -E "ERROR|Failed" logfile` → searches for multiple patterns (ERROR or Failed)  
- `grep -c "ERROR" logfile` → counts occurrences of "ERROR"  
- `grep -n "CRITICAL" logfile` → prints matching lines with line numbers  

---

## Text Processing
- `awk '{print}'` → processes and formats text line by line  
- `awk -F: '{print $1}'` → splits text using delimiter (:)  
- `awk '{$1=$2=$3=""; print}'` → removes first 3 fields (timestamp cleanup)  

---

## Sorting & Counting
- `sort` → sorts lines alphabetically  
- `uniq -c` → counts duplicate lines  
- `sort -rn` → sorts numerically in descending order  
- `head -5` → shows top 5 results  

---

## Pipelines
- `| `→ passes output of one command as input to another  

- Example:
- `grep "ERROR" logfile | sort | uniq -c`

---

## File & Directory Operations
- `mkdir -p archive` → creates directory if it doesn’t exist  
- `mv file archive/` → moves file to another directory  
- `touch file` → creates an empty file  

---

## Report Generation
- `date +%Y-%m-%d`→ gets current date in YYYY-MM-DD format  
- `echo "text" > file` → writes text to file (overwrite)  
- `echo "text" >> file` → appends text to file  

---

## File Inspection
- `cat file` → displays full file content  
- `wc -l` → counts total number of lines in a file  

---

## Execution
- `chmod +x log_analyzer.sh`→ makes script executable  
- `./log_analyzer.sh sample_log.log` → runs script with input file  

---

## Combined Example

- `grep "ERROR" sample_log.log | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5  `
→ extracts top 5 most frequent error messages
---

## Key Learnings

- Log processing using Unix pipelines

- Importance of cleaning data before aggregation

- Writing robust and production-ready Bash scripts

---

## 🏁 Conclusion

- This project demonstrates practical Bash scripting skills used in real-world DevOps workflows, including log analysis, automation, and reporting.

---
