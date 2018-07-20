#!/usr/bin/env bash
docker rm -f $(docker ps -qa)

for (( i=1; i<=2; i++))
do
    echo "Starting node$i"
    docker run -d --name node$i -p 222$i:22 --memory 2Gb node-image
done