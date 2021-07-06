#!/bin/bash

REDIS_NETWORK=redis-cluster_redis_network
REDIS_SERVICE_NAME=redis

REDIS_PORT=6379
CLUSTER_REPLICAS=1

NODES=`docker network inspect ${REDIS_NETWORK} | jq '.[0].Containers | .[].IPv4Address' | perl -wp -e 's!"(.+)/.+"\r?\n!$1:6379 !g'`

docker-compose exec ${REDIS_SERVICE_NAME} bash -c "yes yes | redis-cli --cluster create ${NODES} --cluster-replicas ${CLUSTER_REPLICAS}"
