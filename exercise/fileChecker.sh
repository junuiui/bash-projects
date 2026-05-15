#!/bin/bash

read -p "Enter filename: " file_name

if [ -f "$file_name" ]; then
    echo "----- file content -----"
    cat "$file_name"
    echo "------------------------"
else
    echo "File not found: $file_name"
    exit 1
fi