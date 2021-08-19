#!/bin/bash

##
# This script will loop through all docker images and remove the ones with a
# given tag name, regardless of version.
# ./cleanup.sh <DOCKER IMAGE REPOSITORY>
##

if [[ $# != 1 ]]; then
    echo "script requires one argument for the docker image repository";
    exit 1;
fi

IMAGE_REPO=$1;

tags=$(docker images ${IMAGE_REPO} | awk {'print $2'});

for i in ${tags}; do 
    if [[ $i != "TAG" ]]; then
        docker rmi "${IMAGE_REPO}:$i"
    fi
done

docker images