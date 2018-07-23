#!/usr/bin/env bash
docker service create \
--name hadoop-master \
--network swarm-net \
--hostname hadoop-master \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4

docker service create \
--name hadoop-slave1 \
--network swarm-net \
--hostname hadoop-slave1 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4

docker service create \
--name hadoop-slave2 \
--network swarm-net \
--hostname hadoop-slave2 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4

docker service create \
--name hadoop-slave3 \
--network swarm-net \
--hostname hadoop-slave3 \
--replicas 1 \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4

docker service create \
--replicas 1 \
--name proxy_docker \
--network swarm-net \
-p 7001:7001 \
newnius/docker-proxy