#!/bin/bash
###############################################
#                                             #
#             The FatRat Runit                #
#                                             #
###############################################

TFT_CONTAINER="thefatrat"
POSTGRES_PASSWORD="yourpassword"

mkdir -p /var/containers/$TFT_CONTAINER/var/lib/postgresql/data
chown 999:999 -R /var/containers/$TFT_CONTAINER

docker run -itd --name $TFT_CONTAINER \
    -v /usr/share/zoneinfo:/usr/share/zoneinfo:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/containers/$TFT_CONTAINER/var/lib/postgresql/data:/var/lib/postgresql/data:z \
    -v /var/containers/$TFT_CONTAINER/root/Fatrat_Generated:/root/Fatrat_Generated:z \
    -e "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" \
    -e "TZ=America/Mexico_City" \
    docker.io/kevopsoficial/thefatrat