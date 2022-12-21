Diagram of configurations

```
.
├── auto                        #main live-build configuration
├── config
│   ├── archives                #package mirrors/repositories
│   ├── hooks                   #extra scripts to run during build stages
│   ├── includes.binary         #files to include on the ISO filesystem
│   ├── includes.chroot         #files to include in the live system's filesystem
│   ├── includes.installer      #files to include in the installer's filesystem
│   ├── package-lists
│   │   └── *.list.chroot		#packages to install on the live system
│   │   └── *.list.binary		#packages to place in the APT repository on the ISO image
│   ├── packages.chroot         #standalone .deb packages to install on the live system
│   └── task-lists              #tasksel tasks to install on the live system
├── doc			#user documentation
├── Makefile	#main automation, dependencies management, ...
└── scripts		#extra automation scripts
```

## Files added to /config/includes.chroot.... is added to /
## Files added to /config/includes.chroot/etc/skel .... is added to home/user/


debootstrap to move stable to /stable-chroot in live fs
from http://deb.debian.org/debian

chroot to stable-chroot

## make dev to make default set of static device fiels
# apt install makedev
# mount none /proc -t proc
# cd /dev
# MAKEDEV generic
