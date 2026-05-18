# Info

RPM packaging stuff to install zot container as podman quadlet and provide
container registry service safely and isolated service.

- Author: Satoru SATOH <ssato@redhat.com>
- License: MIT


## Build

Requirements:

- CMake: `dnf install -y cmake`
- podman: ...

### How to build src.tar.gz, src.rpm and binary rpm

0. Pull zot container image

   `make -C oci-images`

1. Build its src.tar.gz, src.rpm and binary rpm

   `./pkg/build.sh`


## Reference

- https://zotregistry.dev/
