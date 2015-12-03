#!/bin/bash -eu

MACHINE=$1
COMPOSE_FILE=$2

SWARM_MASTER=$PREFIX-master-1

if [[ $MACHINE == "swarm" ]]; then
	eval $(docker-machine env --swarm $SWARM_MASTER)
else
	eval $(docker-machine env $MACHINE)
fi

docker-compose -p $COMPOSE_FILE -f $COMPOSE_FILE.yml up -d 
