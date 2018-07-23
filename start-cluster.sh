#!/usr/bin/env bash
docker rm -f $(docker ps -qa)

docker network create --driver bridge hadoop-network

for (( i=1; i<=2; i++))
do
    echo "Starting node$i"
    docker run -d --network=hadoop-network --name node$i -p 222$i:22 --memory 2Gb node-image
done

docker run -d --network=hadoop-network --name node-master -p 2223:22 -p 9870:9870 --memory 2Gb node-image