#!/bin/bash

# Function to display CPU usage
function cpu_usage() {
    echo "---- CPU USAGE ----"
    top -bn1 | grep "Cpu(s)" | awk '{print "Total CPU usage: " 100 - $8"%"}'
    echo
}

# Function to display RAM usage
function ram_usage(){
    echo "---- RAM USAGE ----"
    free -m | awk '/Mem:/ {print "Total RAM usage: " $3 "MB of " $2 "MB"}'
    echo
}

# Function to display Disk usage
function disk_usage() {
    echo "---- DISK USAGE ----"
    df -h --total | awk '/total/ {print "Total disk usage: " $3 " of " $2 " (" $5 " used)"}'
    echo
}

# Function to display top 5 processes by CPU usage
function processes_cpu() {
    echo "---- TOP 5 PROCESSES BY CPU USAGE ----"
    echo "COMMAND          %CPU"
    ps -eo comm,%cpu --sort=-%cpu | head -n 6
    echo
}

# Function to display top 5 processes by RAM usage
function processes_ram(){
    echo "---- TOP 5 PROCESSES BY RAM USAGE ----"
    echo "COMMAND          %MEM"
    ps -eo comm,%mem --sort=-%mem | head -n 6
    echo
}

# Main
cpu_usage
ram_usage
disk_usage
processes_cpu
processes_ram
