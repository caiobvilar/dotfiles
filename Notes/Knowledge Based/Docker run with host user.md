# Docker run with host user
```shell
#!/bin/bash
export UID=$(id -u)
export GID=$(id -g)
export HOSTNAME="$(cat /etc/hostname)"

IMAGE="device-ensembles-dev-env:nuttx12.3"
CONTAINER="device-ensembles-dev-cont-nuttx-only"
NETWORK="host"
APPNAME="ensembles"

echo -e "\nCreating the container with the Docker image ${IMAGE}, using the name ${CONTAINER}"

docker run --tty --interactive \
--network ${NETWORK} \
--device=/dev/video0:/dev/video0 \
--env DISPLAY \
--volume /tmp/.X11-unix \
--volume /dev:/dev \
--volume $(pwd)/../..:/home/${USER}/ensembles \
--volume /home/${USER}/sysroot:/home/${USER}/sysroot \
--volume=/run/user/${UID}/pulse:/run/user/1000/pulse \
--privileged \
--group-add dialout \
--group-add 27 \
--group-add video \
--group-add audio \
--name ${CONTAINER} \
${IMAGE}
```
