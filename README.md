Dont use this, its in progress / not tested yet

# NAS-Synology DS218 - Run docker / Portainer / PIHOLE Server
## Pain point I try to solve ##
NAS Synology DS218 is using a aarch64 architecture that doesnt support official docker synology package.
Trying to bypass that by install aarch64 docker binaries using direct ssh connection to the NAS. 

Most of the data is coming from https://gist.github.com/ta264 and https://wiki.servarr.com/docker-arm-synology
I did my own repo to handle versionning and review the code/script myself.

script to install and configure docker on a DS218 synology.
Fork from https://gist.github.com/ta264
Updated with the last version of docker

get-docker.sh to download docker binaries, install and configure
run.sh to run a container for docker-compose command
