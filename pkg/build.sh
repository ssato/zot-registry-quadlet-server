#! /bin/bash
set -ex -o pipefail

sdir=${0%/*}

${sdir:?}/buildsrc.sh

(
cd build
cp -f ../pkg/{*.spec,buildsrpm.sh} ./
./buildsrpm.sh ./*.spec
)

mock $(ls -1 build/*.src.rpm | head -n 1)
