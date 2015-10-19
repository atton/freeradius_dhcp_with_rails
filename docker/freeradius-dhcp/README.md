# Murasame
Murasame is a freeradius server for testing akatsuki. She runs on the docker. But She is not checked that she runs on the boot2docker. So she is recommended that she is deployed in linux servers.

## Infomation of freeradius
They are her private infomations. So never talk others them.
If you want to know the secret, please read "file/clients.conf"

## Install
Please enter next commands.

* $ docker build -t akatsuki/radius-dhcp docker/radius-dhcp
* $ docker run -itd --name murasame -h murasame -p 1812:1812 1813:1813 1812:1812/udp 1813:1813/udp 67:67 67:67/udp akatsuki/radius-dhcp

## Update
If she is running on the docker, please kill her.
Please check her container id by "docker ps".

* $ docker kill *her_container_id*
* $ docker rm *her_container_id*

The rest is the same as the install section.
