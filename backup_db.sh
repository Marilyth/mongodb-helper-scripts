#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <connection_string> <database_name> <backup_path>"
    exit 1
fi

# Assign command line arguments to variables
CONNECTIONURI="$1"
DBNAME="$2"
BACKUPPATH="$3"

# Mongo command using command line arguments
mongodump --forceTableScan --uri="${CONNECTIONURI}/${DBNAME}?authSource=admin" --gzip --out $BACKUPPATH
