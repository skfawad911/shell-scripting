# Server Monitor Usage Bash Script

This Bash script monitors server usage (CPU, memory, disk space, and network status) and sends an email alert if any resource exceeds a specified threshold.

## Dependencies Installation

To use the email alert feature, ensure that the `sendmail` command is installed on your system. You can install it using the following command:
```bash
sudo apt-get install sendmail
```


## Usage

1. Clone the repository or copy the script content into a file on your server.
2. Make the script executable:

```bash
chmod +x monitor_usage.sh
```

3. Customize the email settings in the script:

- Update the `recipients` variable with the email addresses to receive alerts.
- Modify the `subject` variable to set the email subject.
- Adjust the `sendmail_command` variable to specify the path to the `sendmail` command on your system.

4. Run the script:

```bash
./monitor_usage.sh
```

## Script Overview

The script consists of the following functions:

- `send_mail`: Sends an email alert.
- `monitor_cpu`: Monitors CPU usage.
- `monitor_memory`: Monitors memory usage.
- `monitor_disk_space`: Monitors disk space usage.
- `monitor_network`: Checks network status.
- `main`: Runs monitoring functions and sends alerts if thresholds are exceeded.

## Sample Usage

You can integrate this script into your server monitoring workflow to receive timely alerts about resource usage. Customize the thresholds and email settings according to your requirements.


Feel free to customize and extend this script to suit your specific monitoring needs! If you encounter any issues or have suggestions for improvement, please let me know. Happy monitoring! 🚀🔍
