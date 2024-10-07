#!/bin/bash

for i in {1..20}; do
  # Generate a random file extension
  ext=$(shuf -e .txt .jpg .pdf -n 1)
  
  # Create a temporary file with the chosen extension
  tmpfile=$(mktemp --suffix="$ext")
  
  # Rename the temporary file to a random name with the chosen extension
  mv "$tmpfile" "$(mktemp XXXXXX"$ext")"
done