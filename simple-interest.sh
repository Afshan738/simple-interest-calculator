#!/bin/bash

# Script to calculate simple interest

echo "Simple Interest Calculator"
echo "--------------------------"

# Read principal amount
read -p "Enter the principal amount: " principal

# Read annual interest rate
read -p "Enter the annual interest rate (e.g., 5 for 5%): " rate

# Read time period in years
read -p "Enter the time period in years: " time

# Basic input validation (check if inputs are numbers)
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Principal, rate, and time must be numeric values."
  exit 1
fi

# Calculate simple interest using bc for floating point arithmetic
# Formula: Interest = (Principal * Rate * Time) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $interest" | bc)

echo "--------------------------"
echo "Principal Amount: $principal"
echo "Annual Interest Rate: $rate%"
echo "Time Period: $time years"
echo "Calculated Simple Interest: $interest"
echo "Total Amount (Principal + Interest): $total_amount"
echo "--------------------------"

exit 0
