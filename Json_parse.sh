Basic Usage of jq
1. Echo a JSON String
You can echo a JSON string and then pipe it into jq for parsing.  

Here’s a basic example:

echo '{"name": "Alice", "age": 30, "city": "Wonderland"}' | jq '.'
The above command outputs the formatted JSON:

{
  "name": "Alice",
  "age": 30,
  "city": "Wonderland"
}
2. Extracting Values
You can use jq to extract specific values from the JSON data. 

For instance, if you want to get the name:

echo '{"name": "Alice", "age": 30, "city": "Wonderland"}' | jq '.name'
Output:

"Alice"
3. Working with Arrays
If your JSON contains an array, you can access elements by their indices. 

Example JSON:


{
  "people": [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25}
  ]
}
Extracting names:


echo '{"people": [{"name": "Alice", "age": 30}, {"name": "Bob", "age": 25}]}' | jq '.people[].name'
Output:


"Alice"
"Bob"
4. Conditional Filtering
You can filter objects based on certain conditions using select. 

Example:


json='{"people": [{"name": "Alice", "age": 30}, {"name": "Bob", "age": 25}]}'
echo $json | jq '.people[] | select(.age > 28) | .name'
Output:


"Alice"
Example Script Using jq
Here’s a more comprehensive shell script that demonstrates how to read a JSON file, parse it with jq, and extract and display specific information.

Example Script: parse_json.sh


#!/bin/bash

# Sample JSON file
JSON_FILE='data.json'

# Check if the file exists
if [[ ! -f $JSON_FILE ]]; then
    echo "JSON file not found!"
    exit 1
fi

# Read the JSON data
echo "Reading JSON data from $JSON_FILE..."
# Assuming the JSON structure is:
# {
#   "people": [
#     {"name": "Alice", "age": 30},
#     {"name": "Bob", "age": 25}
#   ]
# }

# Extract names and ages from the JSON
echo "Names and ages from the JSON data:"
jq -r '.people[] | "\(.name) is \(.age) years old"' "$JSON_FILE"
Example JSON File: data.json
Make sure to have a file named data.json with the following content:


{
  "people": [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
    {"name": "Charlie", "age": 35}
  ]
}
Running the Script
Save the script to a file named parse_json.sh.
Make it executable:
CopyReplit
chmod +x parse_json.sh
Run the script:
CopyReplit
./parse_json.sh
Expected Output
When you run the script, you should see:


Reading JSON data from data.json...
Names and ages from the JSON data:
Alice is 30 years old
Bob is 25 years old
Charlie is 35 years old
