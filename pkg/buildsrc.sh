#! /bin/bash
set -ex -o pipefail

cd ${0%/*}/..

make -C oci-images

touch config/cert/server.key
make -C config/cert/

mkdir -p build && cd build
cmake ..
make package_source
