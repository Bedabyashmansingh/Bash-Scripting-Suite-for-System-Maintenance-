#!/bin/bash
# -------------------------------------------
# Project: Bash Scripting Suite for System Maintenance 
# Author: Bedabyash Manasingh 
# Description: Checks disk, memory, and CPU usage.
# -------------------------------------------

#  Check Disk Usage
echo "Checking Disk Usage..."
df -h | grep '^/dev/' > disk_report.txt
echo "Disk usage report saved to disk_report.txt"
echo ""

#  Check Memory Usage
echo "Checking Memory Usage..."
free -h > memory_report.txt
echo "Memory usage report saved to memory_report.txt"
echo ""

#  Check CPU Load
echo "Checking CPU Load..."
uptime > cpu_load.txt
echo "CPU load report saved to cpu_load.txt"
echo ""

#  Warning Section
DISK_ALERT=$(df / | awk 'NR==2 {if ($5+0 > 80) print "Warning: Disk usage above 80%!"}')
MEM_ALERT=$(free | awk '/Mem/ {if ($3/$2 * 100.0 > 80.0) print "Warning: Memory usage above 80%!"}')

if [ -n "$DISK_ALERT" ]; then
  echo "$DISK_ALERT"
fi

if [ -n "$MEM_ALERT" ]; then
  echo "$MEM_ALERT"
fi

#  Summary
echo ""
echo " System health check completed!"
echo "Reports saved in current directory."
