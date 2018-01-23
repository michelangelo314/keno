#!/usr/bin/env sh

## Rebuilds the docker image and clears out the logs

docker container prune -f

cd ..

rm -rf ./logs
docker build -t turtlepower/keno .

