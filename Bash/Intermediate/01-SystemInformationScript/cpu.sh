#!/bin/bash

# Basic bash script to get current CPU usage

echo "System Information Script"
echo "=========================="

# Get the current CPU usage using the top command
echo "Current CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'

# Alternatively, you can use mpstat if it's installed
# echo "Current CPU Usage:"
# mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12"%"}'