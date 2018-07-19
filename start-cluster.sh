#!/usr/bin/env bash
for (( i=1; i<=2; i++))
do
    echo "Starting node$i"
    docker run -d --name node$i --memory 2Gb node-image
done