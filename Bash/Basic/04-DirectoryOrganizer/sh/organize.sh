#!/bin/bash

echo "Welcome to the Directory Organizer!"

# Prompt for the directory to organize
echo "Enter the directory path to organize:"
read target_dir

# Check if the directory exists
if [[ ! -d $target_dir ]]; then
    echo "Directory not found!"
    exit 1
fi

# Change to the target directory
cd "$target_dir"

# Loop through each file in the directory
for file in *; do
    # Skip if it’s a directory
    if [[ -d $file ]]; then
        continue
    fi

    # Get the file extension
    ext="${file##*.}"

    # Create a directory for the file type if it doesn't exist
    mkdir -p "$ext"

    # Move the file into the corresponding directory
    mv "$file" "$ext/"
done

echo "Files organized by type in '$target_dir'."
