#! /bin/bash
set -ex -o pipefail

cd ${0%/*}/..
mkdir -p build && cd build
cmake ..
make package_source
