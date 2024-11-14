##sudo apt-get install parallel

Basic Usage of parallel
The basic syntax is:

CopyReplit
parallel command ::: arg1 arg2 arg3 ...
This runs command on arg1, then arg2, and so on, in parallel.

Example Scenarios
1. Running Commands on Multiple Files
Suppose you have a directory full of text files and you want to compress them using gzip. Instead of compressing them one by one, you can use parallel:

CopyReplit
ls *.txt | parallel gzip
Here, ls *.txt lists all text files, and parallel feeds each file to gzip to run the compression in parallel.

2. Processing Files with a Script
Let’s say you have a script called process_file.sh that processes a file, and you want to run this script for multiple files:

CopyReplit
#!/bin/bash
# process_file.sh

file="$1"
echo "Processing $file..."
# Simulate a time-consuming task
sleep 2
echo "$file processed."
Running the script with parallel:

CopyReplit
# Make sure the script is executable
chmod +x process_file.sh

# Run the script in parallel for the .txt files
ls *.txt | parallel ./process_file.sh
This will call process_file.sh for each text file in the current directory, processing all files in parallel.

3. Performing Tasks on Multiple Servers
If you want to run a command on multiple servers, parallel can help you achieve that easily. For instance, if you wanted to check the disk usage on multiple servers, you could do:

CopyReplit
# Create a file called servers.txt with the list of hostnames/IPs
echo -e "server1\nserver2\nserver3" > servers.txt

# Use parallel to run a command on each server
cat servers.txt | parallel -S : --timeout 30 ssh {} df -h
In this example:

cat servers.txt lists the servers.
-S : tells parallel to connect to each server and run the df -h command for disk usage.
--timeout 30 ensures that if a server takes too long to respond, parallel will terminate that connection.
Advanced Usage with -j Option
You can control the number of parallel jobs using the -j option. For example, if you only want to allow 4 jobs to run concurrently:

CopyReplit
ls *.txt | parallel -j 4 ./process_file.sh
Passing Arguments to Commands
parallel can also manage complex command lines:

CopyReplit
parallel -j 4 echo "Processing file: {}" ::: file1.txt file2.txt file3.txt
Using Input from a Text File
You can also provide input arguments from a text file directly:

CopyReplit
cat input_files.txt | parallel ./process_file.sh
