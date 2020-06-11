# The FatRat 1.9.7 

La creación y desarrollo de la siguiente imagen es totalmente con fines educativos, cualquier uso indevido es responsabilidad del usuario final.

## Despliegue

Declaramos las variables utilizadas para la creación del contenedor.

```
TFT_CONTAINER="thefatrat"
POSTGRES_PASSWORD="yourpassword"
```

Donde:

* **TFT_CONTAINER**: Nombre del contenedor.
* **POSTGRES_PASSWORD**: Password de la base de datos interna de Postgres.

Realizamos la configuración de los volumenes utilizados por el contenedor.

```
mkdir -p /var/containers/$TFT_CONTAINER/var/lib/postgresql/data
chown 999:999 -R /var/containers/$TFT_CONTAINER
```

Realizamos el despliegue del contenedor.

```
docker run -itd --name $TFT_CONTAINER \
    -v /usr/share/zoneinfo:/usr/share/zoneinfo:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/containers/$TFT_CONTAINER/var/lib/postgresql/data:/var/lib/postgresql/data:z \
    -v /var/containers/$TFT_CONTAINER/root/Fatrat_Generated:/root/Fatrat_Generated:z \
    -e "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" \
    -e "TZ=America/Mexico_City" \
    docker.io/kevopsoficial/thefatrat
```

## Variables de Entorno

Las variables de entorno que admite la imagen corresponden por completo a las que se muestran en el despliegue de la bas de datos [Postgres 12.0](https://hub.docker.com/_/postgres).

## Volumenes

Los volumenes utilizados por el contenedor corresponden a la base de datos y al lugar donde The FatRat guarda los archivos creados.

## Puertos

**IMPORTANTE**: Antes de hacer el despliegue del contenedor es preciso tomar en cuenta los puertos utilizados para actividades como *reverse_shell* entre otras, haciendo match de dichos puertos con los de la máquina host. Para ello utilizar la bandera -p.

## Inicio de servicios.

### The FatRat

Para acceder al servicio The FatRat hacemos uso del siguiente comando.

> Importante: Antes de acceder es necesario verificar que el despligue de Postgres haya finalizado. Consultar los logs.

```
docker exec -it $TFT_CONTAINER fatrat
```

### Metasploit 4.0.5

Para acceder al servicio Metasploit hacemos uso del siguiente comando.

> Importante: Antes de acceder es necesario verificar que el despligue de Postgres haya finalizado. Consultar los logs.

```
docker exec -it $TFT_CONTAINER msfconsole
```