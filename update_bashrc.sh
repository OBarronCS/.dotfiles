#!/bin/bash

# Validate number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_file> <target_file>"
    exit 1
fi

source_file="$1"
target_file="$2"

# Array to store missing lines
missing_lines=()

# Read source file line by line
while IFS= read -r line; do
    # Check if line exists in target file (exact match)
    if ! grep -Fxq "$line" "$target_file"; then
        missing_lines+=("$line")
    fi
done < "$source_file"

# Iterate over missing lines and print them
for line in "${missing_lines[@]}"; do
    echo "Not found: $line"
done