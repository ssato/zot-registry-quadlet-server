#! /bin/bash
#
# Build source RPM.
#
set -ex -o pipefail

rpmspec=$1
# rpmspec=$(realpath ${rpmspec:?})
test -f ${rpmspec:?}

builddir=${rpmspec%/*}
test -d ${builddir:?}

rpmbuild_ () {
    rpmbuild --define "_topdir ${builddir}" \
        --define "_srcrpmdir ${builddir}" \
        --define "_sourcedir ${builddir}" \
        --define "_buildroot ${builddir}" \
        -bs $@
}

rpmbuild_ $rpmspec 
