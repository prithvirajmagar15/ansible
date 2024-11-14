#!/bin/bash

# Enable debugging
set -v   # Print commands as they are read
set -x   # Print commands as they are executed

# Sample function to demonstrate a basic operation
calculate_sum() {
    local a=$1
    local b=$2
    local sum=$((a + b))
    echo "Sum of $a and $b is: $sum"
}

# Main script execution
echo "Starting the script..."
calculate_sum 5 10

# Working with a loop
for i in {1..3}; do
    echo "Current iteration: $i"
done

# Disable debugging at the end of script
set +x
set +v

echo "Script completed."
