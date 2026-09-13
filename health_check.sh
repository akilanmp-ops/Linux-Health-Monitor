#!/bin/bash

# ========================================
# Linux System Health Monitor
# ========================================

# Warning thresholds
RAM_THRESHOLD=80
DISK_THRESHOLD=80

# ========================================
# System Information
# ========================================

echo "========================================"
echo "        LINUX SYSTEM HEALTH REPORT"
echo "========================================"

echo
echo "Hostname      : $(hostname)"
echo "User          : $(whoami)"
echo "Uptime        : $(uptime -p)"

# ========================================
# Resource Usage
# ========================================

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo
echo "CPU Usage     : $CPU%"
echo "RAM Usage     : $RAM%"
echo "Disk Usage    : $DISK%"

# ========================================
# RAM Status
# ========================================

if [ "$RAM" -gt "$RAM_THRESHOLD" ]; then
    RAM_STATUS="WARNING"
else
    RAM_STATUS="NORMAL"
fi

echo "RAM Status    : $RAM_STATUS"

# ========================================
# Disk Status
# ========================================

if [ "$DISK" -gt "$DISK_THRESHOLD" ]; then
    DISK_STATUS="WARNING"
else
    DISK_STATUS="NORMAL"
fi

echo "Disk Status   : $DISK_STATUS"

# ========================================
# Network Status
# ========================================

echo
echo "Network Status:"

if ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1; then
    NETWORK_STATUS="CONNECTED"
else
    NETWORK_STATUS="FAILED"
fi

echo "Internet Check : $NETWORK_STATUS"

# ========================================
# SSH Service Status
# ========================================

echo
echo "SSH Service Status:"

SSH_STATUS=$(systemctl is-active ssh)

if [ "$SSH_STATUS" = "active" ]; then
    SSH_DISPLAY="RUNNING"
else
    SSH_DISPLAY="NOT RUNNING"
fi

echo "SSH Service : $SSH_DISPLAY"

# ========================================
# Top CPU-Consuming Processes
# ========================================

echo
echo "Top CPU-Consuming Processes:"
echo "CPU%   PROCESS"

ps aux --sort=-%cpu | awk '
NR>1 && $11 != "ps" && $11 !~ /^\[/ {
    n=split($11,a,"/")
    printf "%-6s %s\n", $3"%", a[n]
}' | head -5

# ========================================
# Overall System Health
# ========================================

echo
echo "Overall System Health:"

if [ "$RAM" -gt "$RAM_THRESHOLD" ] || [ "$DISK" -gt "$DISK_THRESHOLD" ]; then
    HEALTH_STATUS="WARNING"
else
    HEALTH_STATUS="HEALTHY"
fi

echo "STATUS : $HEALTH_STATUS"

echo
echo "========================================"
echo "Report generated : $(date)"
echo "========================================"
