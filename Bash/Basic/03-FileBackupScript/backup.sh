#!/bin/bash

echo "Welcome to the File Backup Script!"

# Prompt for the file to back up
echo "Enter the full path of the file you want to back up:"
read file_to_backup

# Check if the file exists
if [[ ! -f $(realpath "$file_to_backup") ]]; then
    echo "File not found!"
    exit 1
fi

# Prompt for the backup directory
echo "Enter the backup directory (will create if it doesn't exist):"
read backup_dir

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Get the current timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Get the base filename
base_filename=$(basename "$file_to_backup")

# Construct the backup filename
backup_filename="${base_filename%.*}_backup_$timestamp.${base_filename##*.}"

# Copy the file to the backup directory
cp "$file_to_backup" "$backup_dir/$backup_filename"

echo "Backup of '$file_to_backup' created at '$backup_dir/$backup_filename'"
