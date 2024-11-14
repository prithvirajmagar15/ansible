#!/bin/bash

# Create a sample CSV file for demonstration
echo "Creating sample CSV file..."
cat <<EOL > users.csv
Name,Age,City
Alice,30,New York
Bob,25,Los Angeles
Charlie,35,Chicago
David,28,San Francisco
Eve,40,Seattle
EOL

# 1. Print the entire content of the CSV file
echo "Contents of users.csv:"
awk '{print}' users.csv

# 2. Print only the names (1st column)
echo -e "\nNames of users:"
awk -F',' 'NR > 1 {print $1}' users.csv

# 3. Print users whose age is greater than 30
echo -e "\nUsers older than 30:"
awk -F',' 'NR > 1 && $2 > 30 {print $1, $2, $3}' users.csv

# 4. Count the number of users
user_count=$(awk -F',' 'END {print NR-1}' users.csv)
echo -e "\nTotal number of users: $user_count"

# 5. Print average age of users
average_age=$(awk -F',' 'NR > 1 { total += $2; count++ } END { if (count > 0) print total/count; else print 0 }' users.csv)
echo -e "\nAverage age of users: $average_age"

# Clean up the CSV file
rm users.csv
echo -e "\nSample CSV file removed."
