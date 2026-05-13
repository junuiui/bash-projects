#!/bin/bash

# This file is for you to find the data for specific IP address
# How to use:
#   sh find_ip.sh [IP_Address] [relative file location]

# Check if arguments are valid
# $1: IP Address, $2: File Path
if [ -z "$1" ] || [ -z "$2" ] || [ "$#" -ne 2 ]; then
    echo "Usage: $0 [IP_Address] [file_location]"
    exit 1
fi

awk -v ip="$1" '$0 ~ ip {print}' $2 > output/find_ip.log

exit 0