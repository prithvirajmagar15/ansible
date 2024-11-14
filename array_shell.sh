#!/bin/bash

# Declare an array
fruits=("Apple" "Banana" "Cherry" "Date")

# Print the entire array
echo "Fruits: ${fruits[@]}"

# Print the number of elements in the array
echo "Number of fruits: ${#fruits[@]}"

# Access individual elements of the array
echo "First fruit: ${fruits[0]}"
echo "Second fruit: ${fruits[1]}"
echo "Third fruit: ${fruits[2]}"

# Loop through the array elements
echo "All fruits in the array (using for loop):"
for fruit in "${fruits[@]}"; do
    echo "- $fruit"
done

# Adding a new element to the array
fruits+=("Elderberry")
echo "After adding a new fruit: ${fruits[@]}"

# Removing an element from the array (removes the element at index 1)
unset fruits[1]  # this will remove "Banana"
echo "After removing a fruit: ${fruits[@]}"

# Re-indexing the array (optional but can be useful)
fruits=("${fruits[@]}")  # creates a new array with re-indexed elements
echo "After re-indexing, remaining fruits: ${fruits[@]}"

# Finding the index of an element
for i in "${!fruits[@]}"; do
    if [[ "${fruits[$i]}" == "Cherry" ]]; then
        echo "Cherry is found at index $i"
    fi
done
