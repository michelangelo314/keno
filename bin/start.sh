#!/usr/bin/env bash

## Starts the turtlecoind container

set -o errexit
set -o pipefail

CONTAINER_NAME=turtlepower-keno

which docker &> /dev/null
if [ $? -eq 0 ]; then
    docker --version | grep "Docker version" &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Docker found at [`which docker`]"
    else
        echo "FATAL: Unable to find docker installation. "
        exit 1
    fi
else
    echo "FATAL: Unable to find docker installation."
    exit 1
fi

# This will only start up if the container isnt already running
if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Starting up docker"
    cd ..
    mkdir -p logs
    docker run --rm --name "$CONTAINER_NAME" -d \
                -p 11897:11897 \
                -v "$PWD"/data:/data \
                -v "$PWD"/logs:/var/log \
                turtlepower/keno /sbin/my_init -- "$@"
    echo "Cowabunga!! Container started!"
fi

echo "Turtle daemon is running. Check the logs/turtlecoind.log for more information."
