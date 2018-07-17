#!/bin/bash -ex

## add default Jetstream user (uid:1000) to docker group so the user does not
## have to type `sudo docker` each time.
## https://www.explainxkcd.com/wiki/index.php/149:_Sandwich
JETSTREAM_USER=$(getent passwd 1000 | cut -d: -f1)
adduser $JETSTREAM_USER docker

## automatically install and enable byobu for the default Jetstream user
apt-get -y install byobu
sudo -u $JETSTREAM_USER -i /usr/bin/byobu-launcher-install
