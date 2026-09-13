# 🌀Linux System Health Monitor

A Bash-based Linux system monitoring tool that checks important system resources and services, evaluates their health, and generates a clear system health report.

The project also uses Cron to automatically execute the health check at regular intervals and store the generated reports in a log file.

## 🚀Features

- CPU usage monitoring
- RAM usage monitoring
- Disk usage monitoring
- Configurable RAM warning threshold
- Configurable disk warning threshold
- Internet connectivity check
- SSH service status monitoring
- CPU-consuming processes
- Overall system health status
- Timestamped health reports
- Automated execution using Cron
- Log file generation

## 🔀Project Workflow

    Linux System
         │
         ├── CPU Usage
         ├── RAM Usage
         ├── Disk Usage
         ├── Network Connectivity
         ├── SSH Service
         └── Running Processes
                  │
                  ▼
           Bash Health Check
                  │
                  ▼
           Health Evaluation
                  │
            ┌─────┴─────┐
            ▼           ▼
         HEALTHY      WARNING
            │           │
            └─────┬─────┘
                  ▼
              Health Log
                  │
                  ▼
                 Cron

## 🛠️ Technologies Used

- Linux
- Bash Shell Scripting
- Cron
- AWK
- ps
- top
- free
- df
- ping
- systemctl

## 📝Requirements

- Linux operating system
- Bash
- SSH service for SSH monitoring

## 📥Installation

Clone the repository:

    git clone <your-repository-url>

Enter the project directory:

    cd LinuxHealthMonitor

Make the script executable:

    chmod +x health_check.sh

## ⚙️ Usage

Run the health monitor:

    ./health_check.sh

The script checks:

- CPU usage
- RAM usage
- Disk usage
- Internet connectivity
- SSH service status
- Top CPU-consuming processes
- Overall system health

## ⚠️ Warning Thresholds

The default warning thresholds are:

    RAM_THRESHOLD=80
    DISK_THRESHOLD=80

If RAM or disk usage exceeds 80%, the corresponding status changes to WARNING.

The overall system health also changes to WARNING if either RAM or disk usage exceeds the configured threshold.

## 🦾Cron Automation

The health monitor can be automated using Cron.

Open the Cron configuration:

    crontab -e

Add the following line:

    */5 * * * * /home/akilan/Project/Linuxhealthmonitor/health_check.sh >> /home/akilan/health.log 2>&1

This runs the health monitor every 5 minutes.

The output is automatically appended to:

    /home/akilan/health.log

View the generated log:

    cat ~/health.log

For live monitoring:

    tail -f ~/health.log

## 🎯Sample Output

    ========================================
            LINUX SYSTEM HEALTH REPORT
    ========================================

    Hostname      : Debian
    User          : akilan
    Uptime        : up 40 minutes

    CPU Usage     : 4%
    RAM Usage     : 27%
    Disk Usage    : 23%
    RAM Status    : NORMAL
    Disk Status   : NORMAL

    Network Status:
    Internet Check : CONNECTED

    SSH Service Status:
    SSH Service : RUNNING

    Top CPU-Consuming Processes:
    CPU%   PROCESS
    18.3%  brave
    10.6%  gnome-shell
    10.4%  brave
    5.2%   qemu-system-x86_64
    3.5%   brave

    Overall System Health:
    STATUS : HEALTHY

    ========================================
    Report generated : Sunday 13 September 2026 03:03:13 PM IST
    ========================================

## 🏗️ Project Structure

    LinuxHealthMonitor/
    │
    ├── health_check.sh
    ├── README.md
    ├── LICENSE
    ├── .gitignore
    │
    ├── logs/
    │   └── .gitkeep
    │
    └── screenshots/
        └── health-report.png

## 💡Learning Outcomes

Through this project, I practiced:

- Bash scripting
- Variables and command substitution
- Conditional statements
- Pipes and redirection
- AWK text processing
- Process monitoring
- Linux service management
- Network connectivity testing
- File permissions
- Cron job automation
- Linux system administration

## ⏳Future Improvements

- CPU warning threshold
- Monitoring multiple services
- Email notifications
- Alert notifications
- Historical usage analysis
- Web dashboard
- Multi-server monitoring
- Windows PowerShell version
- Cloud-based monitoring

## 📚Author

**Akilan**

EEE Student | Linux & Cloud Security Learner
