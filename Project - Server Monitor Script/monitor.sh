#!/bin/bash

# Mail settings
recipients='skfawad911@gmail.com'
subject="Server Alert"
sendmail_command='/usr/sbin/sendmail'

# Function to send email
send_mail() {
	local message="$1"
	echo -e "Subject: $subject\n$message" | $sendmail_command -t "$recipients"
}

# Function to monitor CPU usage
monitor_cpu() {
    cpu_info=$(top -bn1 | grep "Cpu(s)")
    if [ $? -ne 0 ]; then
        echo "Error: Failed to fetch CPU information."
        return 1
    fi
    
    cpu_usage=$(echo "$cpu_info" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
    if [ -z "$cpu_usage" ]; then
        echo "Error: Failed to extract CPU usage."
        return 1
    fi
    
    cpu_usage_percentage=$(awk -v cpu_usage="$cpu_usage" 'BEGIN { print 100 - cpu_usage }')
    if [ $? -ne 0 ]; then
        echo "Error: Failed to calculate CPU usage percentage."
        return 1
    fi
    
    echo "CPU Usage: $cpu_usage_percentage%"
    if (( $(echo "$cpu_usage_percentage > 90" | bc -l) )); then
        message="High CPU usage detected on the server! Current CPU usage: $cpu_usage_percentage%"
        send_mail "$message"
    fi
}

# Function to monitor memory usage
monitor_memory() {
    memory_info=$(free -m | grep Mem)
    if [ $? -ne 0 ]; then
        echo "Error: Failed to fetch memory information."
        return 1
    fi
    
    total_memory=$(echo "$memory_info" | awk '{print $2}')
    used_memory=$(echo "$memory_info" | awk '{print $3}')
    if [ -z "$total_memory" ] || [ -z "$used_memory" ]; then
        echo "Error: Failed to extract memory information."
        return 1
    fi
    
    memory_usage=$(awk -v used="$used_memory" -v total="$total_memory" 'BEGIN { print (used / total) * 100 }')
    if [ $? -ne 0 ]; then
        echo "Error: Failed to calculate memory usage."
        return 1
    fi
    
    echo "Memory Usage: $memory_usage%"
    if (( $(echo "$memory_usage > 90" | bc -l) )); then
        message="High memory usage detected on the server! Current memory usage: $memory_usage%"
        send_mail "$message"
    fi
}

# Function to monitor disk space
monitor_disk_space() {
    disk_space_info=$(df -h / | grep "/dev/root")
    if [ $? -ne 0 ]; then
        echo "Error: Failed to fetch disk space information."
        return 1
    fi
    
    disk_space=$(echo "$disk_space_info" | awk '{print $5}' | sed 's/%//')
    if [ -z "$disk_space" ]; then
        echo "Error: Failed to extract disk space information."
        return 1
    fi
    
    echo "Disk Space Usage: $disk_space%"
    if (( $disk_space > 90 )); then
        message="Low disk space detected on the server! Current disk space usage: $disk_space%"
        send_mail "$message"
    fi
}

# Function to monitor network status
monitor_network() {
    ping -c 1 google.com > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Error: Failed to ping google.com. Network status could not be determined."
        return 1
    fi
    
    echo "Network Status: Connected"
}

# Main function to run monitoring functions
main() {
    echo "Server Monitoring started..."
    monitor_cpu || return 1
    monitor_memory || return 1
    monitor_disk_space || return 1
    monitor_network || return 1
    echo "Server Monitoring completed."
}

# Execute the main function
main
