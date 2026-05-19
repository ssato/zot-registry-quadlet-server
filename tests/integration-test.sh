#! /bin/bash
set -ex -o pipefail

#opt="--tls-verify=false"
opt=""

#registry=localhost
registry=registry.lab-10.local

systemctl is-active zot || sudo systemctl start zot

# push
podman pull alpine:latest
podman tag alpine:latest ${registry}:5000/test-alpine-0:latest
podman push ${registry}:5000/test-alpine-0:latest ${opt}

# pull
podman rmi ${registry}:5000/test-alpine-0:latest
podman pull ${registry}:5000/test-alpine-0:latest ${opt}

# cleanup
podman rmi ${registry}:5000/test-alpine-0:latest
