#!/bin/bash
# SIGINT (triggered by Ctrl+C), SIGTERM (termination request), and EXIT.
# Function to clean up and exit
cleanup() {
    echo "Cleaning up..."
    # Here you can add commands to remove temporary files or release resources
    rm -f temp_file.txt
    echo "Exiting script."
    exit
}

# Set trap to catch SIGINT (Ctrl+C) and SIGTERM
trap cleanup SIGINT SIGTERM

# Simulate a long-running task
echo "Script is running. Press Ctrl+C to interrupt or send SIGTERM to terminate."
# Create a temporary file for demonstration
touch temp_file.txt

# Infinite loop to keep the script running
while true; do
    echo "Working... (Press Ctrl+C to stop)"
    sleep 2  # Simulate some work being done
done
