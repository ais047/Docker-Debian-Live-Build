# syntax=docker/dockerfile:1.3-labs

## you can install the neccessary packages and use that as an image to speed this
FROM debian as debian-builder
WORKDIR /root/.build/debian-live

## Needs .build on /root/
COPY . /root/.build/

RUN echo "hello" > build.txt

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y live-build

SHELL ["/bin/bash", "-c"]

RUN lb clean
RUN --security=insecure lb config --debian-installer live --debian-installer-preseedfile "preseed.cfg"

## Monkey Patch to fix mounting issue: 
## https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=919659
## This Line is 1179 instead of 1161 in Debian 11 as of Dec 20, 2022
RUN sed -i '1179s%umount%#umount%' /usr/share/debootstrap/functions
RUN --security=insecure lb build


# ## DOCKER_BUILDKIT=1 docker build --file Dockerfile --output out .
FROM scratch as export-stage
COPY --from=debian-builder /root/.build/debian-live/live-image-amd64.hybrid.iso .
