#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <max_files> <path>"
    exit 1
fi

# Assign command line arguments to variables
MAXFILES="$1"
LIMITPATH="$2"

# Remove old files.
cd $LIMITPATH
fileAmount=$(ls -t | wc -l)

echo "$fileAmount files found"
if [ "$fileAmount" -gt "$MAXFILES" ]; then
    excessBackups="$((fileAmount-MAXFILES))"
    toRemove=$(ls -t | tail -${excessBackups})

    echo "Removing $excessBackups files: $toRemove"
    rm -rf $(ls -t | tail -${excessBackups})
fi
