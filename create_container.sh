#!/bin/bash

# Check if all required parameters are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <username> <password> <port> <volume_path>"
    exit 1
fi

# Assign command line arguments to variables
USERNAME="$1"
PASSWORD="$2"
PORT="$3"
VOLUME_PATH="$4"

# Docker command using command line arguments
docker create -it --log-opt max-size=10m --log-opt max-file=5 -v "$VOLUME_PATH":/data/db -p ${PORT}:27017 --restart unless-stopped --name mongocontainer -e MONGO_INITDB_ROOT_USERNAME="$USERNAME" -e MONGO_INITDB_ROOT_PASSWORD="$PASSWORD" mongo:4.4.16 mongod --auth
echo "Done, start the container with 'docker start mongocontainer', stop it with 'docker stop mongocontainer'"
