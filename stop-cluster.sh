#!/usr/bin/env bash
docker stop $(docker ps -q)

docker network rm hadoop-network
