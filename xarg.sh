#!/bin/bash

# Create a dummy file list for demonstration
echo "Creating test files..."
for i in {1..10}; do
    echo "This is file number $i" > "file$i.txt"
done

# Function to simulate a task
process_file() {
    file=$1
    echo "Processing $file..."
    sleep 1  # Simulated task duration
    echo "$file processed."
}

export -f process_file  # Export the function for parallel execution

# Use `find` to list files and `xargs` to process them in parallel
find . -name "file*.txt" | xargs -n 1 -P 4 bash -c 'process_file "$@"' _

# Clean up test files
echo "Cleaning up test files..."
rm file*.txt

echo "All files processed."
