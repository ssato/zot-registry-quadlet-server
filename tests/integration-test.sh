#! /bin/bash
set -ex -o pipefail


systemctl is-active zot || sudo systemctl start zot

# push
podman pull alpine:latest
podman tag alpine:latest localhost:5000/test-alpine-0:latest
podman push localhost:5000/test-alpine-0:latest  --tls-verify=false

# pull
podman rmi localhost:5000/test-alpine-0:latest
podman pull localhost:5000/test-alpine-0:latest  --tls-verify=false

# cleanup
podman rmi localhost:5000/test-alpine-0:latest
