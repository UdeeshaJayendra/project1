#!/bin/bash

echo "=============================="
echo "   SERVER PERFORMANCE STATS   "
echo "=============================="

# CPU Usage
echo ""
echo "🔹 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " 100 - $8 "%"}'

# Memory Usage
echo ""
echo "🔹 Memory Usage:"
free -m | awk 'NR==2{
    total=$2; used=$3; free=$4;
    printf "Total: %dMB\nUsed: %dMB\nFree: %dMB\nUsage: %.2f%%\n", total, used, free, used*100/total
}'

# Disk Usage
echo ""
echo "🔹 Disk Usage:"
df -h / | awk 'NR==2{
    printf "Total: %s\nUsed: %s\nFree: %s\nUsage: %s\n", $2, $3, $4, $5
}'

# Top 5 CPU processes
echo ""
echo "🔹 Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Memory processes
echo ""
echo "🔹 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Extra (Stretch goals)

echo ""
echo "🔹 System Uptime:"
uptime

echo ""
echo "🔹 OS Version:"
cat /etc/os-release | grep PRETTY_NAME

echo ""
echo "🔹 Logged in Users:"
who

echo ""
echo "=============================="
echo "        END OF REPORT         "
echo "=============================="
