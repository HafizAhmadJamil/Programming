#!/bin/bash

# Print a welcome message
echo "Welcome to the Basic Calculator!"

# Prompt the user to enter the first number and read the input
echo "Enter first number:"
read num1

# Prompt the user to enter the second number and read the input
echo "Enter second number:"
read num2

# Prompt the user to choose an operation and read the input
echo "Choose an operation: +, -, *, /"
read operation

# Use a case statement to handle different operations
case $operation in
    +)
        # Perform addition using bc (basic calculator) and store the result
        result=$(echo "$num1 + $num2" | bc)
        ;;
    -)
        # Perform subtraction using bc and store the result
        result=$(echo "$num1 - $num2" | bc)
        ;;
    \*)
        # Perform multiplication using bc and store the result
        result=$(echo "$num1 * $num2" | bc)
        ;;
    /)
        # Perform division using bc, setting the scale to 2 for decimal precision, and store the result
        result=$(echo "scale=2; $num1 / $num2" | bc)
        ;;
    *)
        # Handle invalid operations
        echo "Invalid operation!"
        exit 1
        ;;
esac

# Print the result of the calculation
echo "Result: $result"