#!/usr/bin/env bash
docker build \
    -t node-image \
    --file node-master/Dockerfile \
    --build-arg ssh_key="$(cat ~/.ssh/id_rsa)" \
    --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" .