#! /bin/bash
#remove all containers by listing all ids
docker rm `docker ps -aq`
#remove all images by listing all ids
docker rmi -f `docker images -q`
