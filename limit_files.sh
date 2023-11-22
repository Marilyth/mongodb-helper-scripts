#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <max_files> <path>"
    echo "path can also contain wildcards to limit this script to specific files/dirs."
    exit 1
fi

# Assign command line arguments to variables
MAXFILES="$1"
LIMITPATH="$2"

# Remove old backups.
maxBackups="$MAXFILES"
backupAmount=$(ls -t $LIMITPATH | wc -l)
if [ "$backupAmount" -gt "$maxBackups" ]; then
    excessBackups="$((backupAmount-maxBackups))"
    rm -rf $(ls -t $LIMITPATH | tail -${excessBackups})
fi
