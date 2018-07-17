#!/bin/sh

# pull the notebook
docker pull rocker/rstudio

# start the container
docker run --name my_container_name -p 8787:8787 -v $(pwd):/home/rstudio/foobar -e GRANT_SUDO=yes -d rocker/rstudio
