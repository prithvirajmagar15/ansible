#!/bin/bash

# Function to calculate Fibonacci number recursively
fibonacci_recursive() {
    if [ $1 -le 1 ]; then
        echo $1
    else
        local prev1=$(fibonacci_recursive $(( $1 - 1 )))
        local prev2=$(fibonacci_recursive $(( $1 - 2 )))
        echo $(( prev1 + prev2 ))
    fi
}

# Function to calculate Fibonacci numbers using a loop
fibonacci_loop() {
    local count=$1

    # Check for non-positive input
    if [ $count -lt 0 ]; then
        echo "Please enter a non-negative integer."
        return
    fi

    echo "Fibonacci sequence up to $count:"
    local a=0
    local b=1

    for (( i=0; i<count; i++ )); do
        echo -n "$a "
        local next=$(( a + b ))
        a=$b
        b=$next
    done
    echo ""  # New line after the sequence
}

# Main script logic
echo "Calculating Fibonacci sequence..."
read -p "Enter the number of terms for the Fibonacci sequence: " num_terms

# Call the loop function
fibonacci_loop $num_terms

# Call the recursive function for the nth Fibonacci number
echo "Calculating Fibonacci number recursively for $num_terms..."
fibonacci_number=$(fibonacci_recursive $num_terms)
echo "Fibonacci($num_terms) = $fibonacci_number"
