CONTAINER_NAME=turtlepower-keno

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping $CONTAINER_NAME"
    docker rm --force $CONTAINER_NAME >/dev/null 2>&1
    echo "$CONTAINER_NAME stopped. Gnarly!"
else
    echo "Bummer! It doesn't look like TurtleCoinD is running. Try docker ps and docker kill manually."
fi
