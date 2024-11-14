#!/bin/bash

# Example 1: Get the current date and time
current_date=$(date)
echo "Current Date and Time: $current_date"

# Example 2: Get the current user's name
current_user=$(whoami)
echo "Current User: $current_user"

# Example 3: Get the list of files in the current directory
files=$(ls)
echo "Files in the current directory:"
echo "$files"

# Example 4: Count the number of lines in a file (you can create a test file for this)
# Create a test file
echo "Line 1" > testfile.txt
echo "Line 2" >> testfile.txt
echo "Line 3" >> testfile.txt

# Count lines in the file dynamically
line_count=$(wc -l < testfile.txt)
echo "Number of lines in testfile.txt: $line_count"

# Clean up test file
rm testfile.txt
