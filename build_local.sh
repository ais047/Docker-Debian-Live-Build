#!/bin/bash
## This script is required to be run from a Debian 11 system.

cd ./local
lb clean
lb config --debian-installer live --debian-installer-preseedfile "preseed.cfg"
lb build
