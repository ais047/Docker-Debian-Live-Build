# syntax=docker/dockerfile:1.4
FROM debian-builder as debian-builder
WORKDIR /root/.build/debian-live

## Needs .build on /root/
# RUN mkdir /root/.build

COPY . /root/.build/

RUN echo "hello" > build.txt

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y live-build

SHELL ["/bin/bash", "-c"]

## Monkey Patch to fix mounting issue: 
## https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=919659
## This Line is 1179 instead of 1161 in Debian 11 as of Dec 20, 2022
RUN sed -i '1179s%umount%#umount%' /usr/share/debootstrap/functions
RUN tail --lines=+1170 /usr/share/debootstrap/functions
RUN lb build


# ## DOCKER_BUILDKIT=1 docker build --file Dockerfile --output out .
# FROM scratch as export-stage
# COPY --from=debian-builder /debian-live/live-image-amd64.hybrid.iso .
