# NAS-Synology DS218 - Run docker / Portainer / PIHOLE Server

Dont use this, its in progress / not tested yet

## Pain point I try to solve ##
NAS Synology DS218 is using a aarch64 architecture that doesnt support official docker synology package.
Trying to bypass that by install aarch64 docker binaries using direct ssh connection to the NAS. 

Most of the data is coming from https://gist.github.com/ta264 and https://wiki.servarr.com/docker-arm-synology
I did my own repo to handle versionning and review the code/script myself.

### Activate ssh on your NAS and get root ###
1) On your DSM interface go to the parameters / Terminal & SNMP
2) Check activate ssh access box
3) Open a powershell terminal and run this commands: 

``` ssh user@yourNasIP -p 22 ```
type yes
type your password
to get root 

```` sudo -i ````

### Installation of docker and configuration ###

curl https://gist.githubusercontent.com/ta264/2b7fb6e6466b109b9bf9b0a1d91ebedc/raw/b76a28d25d0abd0d27a0c9afaefa0d499eb87d3d/get-docker.sh | sh


### under progress ###




script to install and configure docker on a DS218 synology.
Fork from https://gist.github.com/ta264
Updated with the last version of docker

get-docker.sh to download docker binaries, install and configure
run.sh to run a container for docker-compose command
