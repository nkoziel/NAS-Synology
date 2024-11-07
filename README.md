# NAS-Synology DS218 - Run docker / Portainer / PIHOLE Server

Tested on my DS218.

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

### Add your user to docker group in DSM interface ###

<img width="1243" alt="image" src="https://user-images.githubusercontent.com/61791981/215273564-ef207f9a-80a8-433c-a7a1-93ce523082b6.png">

> Reboot your NAS

### Build a portainer container ###
```
sudo -i
cd /volume1/@docker/portainer
docker-compose up -d
```
Expected outcome : 

<img width="362" alt="image" src="https://user-images.githubusercontent.com/61791981/215274868-7a113544-668f-479f-8033-171e0b237950.png">

Then go to the portainer homepage to configure it : 

in your browser : youNasIP:9000

Setup your admin account 

Portainer is now working and should ask to setup the admin password:

<img width="1710" alt="image" src="https://user-images.githubusercontent.com/61791981/215311158-cb2d81a3-3d42-4811-ad4a-6c6b75dff490.png">

Now if you want to build pihole image and start a container:

```
cd /volume1/@docker/pihole
docker-compose up -d
```
expected outcome : 

<img width="361" alt="image" src="https://user-images.githubusercontent.com/61791981/215328522-7423f92c-aa47-4735-b55e-3a0228e52ca6.png">

You can now access your pihole homepage using `YourNasIP:8888/admin` url




