#!/bin/sh

# pull the image
docker pull jupyter/r-notebook

# start container with the r-notebook Docker image
docker run --name my_container_name -p 80:8888 -v $(pwd):/home/jovyan/work -e GRANT_SUDO=yes -d jupyter/r-notebook jupyter notebook --ip=0.0.0.0

# wait briefly
sleep 3

# show us where the Jupyter notebook server is running
docker exec my_container_name jupyter notebook list
