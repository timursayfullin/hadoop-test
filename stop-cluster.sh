#!/usr/bin/env bash
echo $(docker ps -q)
docker stop $(docker ps -q)
