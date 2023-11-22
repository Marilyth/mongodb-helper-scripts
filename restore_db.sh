#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <connection_string> <backup_path>"
    exit 1
fi

# Assign command line arguments to variables
CONNECTIONURI="$1"
BACKUPPATH="$2"

# Mongo command using command line arguments
mongorestore --uri="$CONNECTIONURI" --gzip $BACKUPPATH
