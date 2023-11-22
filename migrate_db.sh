#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_connection_string> <database_name> <destination_connection_string>"
    exit 1
fi

# Assign command line arguments to variables
SRCCONNECTIONURI="$1"
DBNAME="$2"
DSTCONNECTIONURI="$3"

# Commands using command line arguments
./backup_db.sh $SRCCONNECTIONURI $DBNAME ./dump
./restore_db.sh $DSTCONNECTIONURI ./dump

rm -rf ./dump
