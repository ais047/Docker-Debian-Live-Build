#!/bin/bash

echo "Start Builder Script"

# DOCKER_BUILDKIT=1 docker build --file Dockerfile --output out .
docker build --file Dockerfile --output out .

# BUILDERNAME=debian-builder
# docker container stop $BUILDERNAME
# docker container rm $BUILDERNAME

# docker run --name $BUILDERNAME --cap-add SYS_ADMIN --privileged -h 10-slim -e LANG=C.UTF-8 -it debian-builder
# docker start $BUILDERNAME

# DOCKERCONTAINERID=$(docker ps --format "{{.ID}}")
# echo $DOCKERCONTAINERID

# docker cp ./debian-live $DOCKERCONTAINERID:/root/.build

# docker run --name $BUILDERNAME --cap-add SYS_ADMIN --privileged -h 10-slim -e LANG=C.UTF-8 -it debian-builder /bin/bash cp /root/.build/debian-live && lb build

# docker cp $DOCKERCONTAINERID:/root/.build/debian-live ./out/






# docker run --name debian-builder --cap-add SYS_ADMIN --privileged -h 10-slim -e LANG=C.UTF-8 -it debian /bin/bash -l
# docker container rm debian-slim

# mkdir .build/debian-live
# apt-get -y update
# apt-get -y upgrade
# apt-get -y install live-build vim

### Start Live Build Configuration ###
# lb config

### < PACKAGE CONFIGURATION > ### 
# vim config/package-lists/pkgs.list.chroot
## > Add to file: nano vim debian-installer

### Start Live Build ISO Build ###



echo "Ending Builder Script"
