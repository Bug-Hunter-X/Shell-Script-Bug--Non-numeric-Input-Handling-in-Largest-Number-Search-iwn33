#!/bin/bash

# Improved script to handle non-numeric input

input_file="numbers.txt"

largest_number=0

is_number() {
  [[ "$1" =~ ^-?[0-9]+$ ]] && return 0 || return 1
}

while IFS= read -r number; do
  if is_number "$number"; then
    if [[ "$number" -gt "$largest_number" ]]; then
      largest_number="$number"
    fi
  else
    echo "Warning: Skipping non-numeric value: $number"
  fi
done < "$input_file"

echo "The largest number is: $largest_number"