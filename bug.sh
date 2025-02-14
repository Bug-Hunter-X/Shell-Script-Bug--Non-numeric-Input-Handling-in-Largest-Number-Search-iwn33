#!/bin/bash

# This script attempts to find the largest number in a file, but contains a subtle bug.

input_file="numbers.txt"

largest_number=0

while IFS= read -r number; do
  if [[ "$number" -gt "$largest_number" ]]; then
    largest_number="$number"
  fi
  #The bug is that the script will fail if the input file contains any non-numeric values. 
  #This is because the -gt operator will fail on non-numeric strings and the script will exit with an error.
done < "$input_file"

echo "The largest number is: $largest_number"