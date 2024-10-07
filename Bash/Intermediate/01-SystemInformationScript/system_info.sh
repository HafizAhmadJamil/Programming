#!/bin/bash

echo "System Information Script"
echo "=========================="

# Display the current date and time
echo "Date and Time: $(date)"

# Display the hostname
echo "Hostname: $(hostname)"

# Display CPU usage
echo "Current CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'

# Display Memory usage
echo "Memory Usage:"
free -h | awk '/^Mem:/ {print "Used: " $3 " / Total: " $2}'

# Display Disk usage
echo "Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %d/%d (%s)\n", $3, $2, $5}'

# Timezone information
timezone=$(timedatectl | grep "Time zone" | awk '{print $3}')
if [[ -n "$timezone" ]]; then
    echo "Timezone: $timezone"
else
    echo "Timezone information not available."
fi

echo "=========================="
