# NAS-Synology DS218 - Run docker / Portainer / PIHOLE Server

Dont use this, its in progress / not tested yet

## Pain point I try to solve ##
NAS Synology DS218 is using a aarch64 architecture that doesnt support official docker synology package.
Trying to bypass that by install aarch64 docker binaries using direct ssh connection to the NAS. 

Most of the data is coming from https://gist.github.com/ta264 and https://wiki.servarr.com/docker-arm-synology
I did my own repo to handle versionning and review the code/script myself.

To help understand what is done you can also read this :
https://dev.to/behainguyen/synology-ds218-unsupported-docker-installation-and-usage-2g1n


### Activate ssh on your NAS and get root ###
1) On your DSM interface go to the parameters / Terminal & SNMP
2) Check activate ssh access box

<img width="1370" alt="image" src="https://user-images.githubusercontent.com/61791981/215271153-a2917371-10a1-4ac5-ba5f-7675da348506.png">


3) Open a powershell terminal and run this commands: 

``` ssh user@yourNasIP -p 22 ```

type yes

type your password

to get root :

``` sudo -i ```

Expected outcome :

<img width="363" alt="image" src="https://user-images.githubusercontent.com/61791981/215270939-5f3dd7a8-862b-47e8-be9f-c785d5368f93.png">

### Installation of docker and configuration ###

``` curl https://raw.githubusercontent.com/nkoziel/NAS-Synology/main/get-docker.sh | sh ```

If all goes well you should see the message:

> Done. Please add your user to the Docker group in the Synology GUI and reboot your NAS.

### under progress ###




script to install and configure docker on a DS218 synology.
Fork from https://gist.github.com/ta264
Updated with the last version of docker

get-docker.sh to download docker binaries, install and configure
run.sh to run a container for docker-compose command
