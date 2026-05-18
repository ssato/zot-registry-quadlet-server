cmake_minimum_required(VERSION 3.10)
project(zot-registry-quadlet-server
        VERSION 0.1.0
	LANGUAGES NONE)

set(CPACK_PACKAGE_NAME "zot-registry-quadlet-server")
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_SOURCE_IGNORE_FILES
    "/build/"
    "/.git/"
    "/.gitignore"
    ".swp$"
    "/oci-images/pull.stamp"
    "/oci-images/Makefile"
    "/pkg/"
)
include(CPack)

set(IMAGE_TAR "zot-linux-amd64.tar")
set(IMAGE_DEST_DIR "/usr/share/${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")

install(FILES "config/quadlet/zot.container"
        DESTINATION "/etc/containers/systemd")

install(FILES "config/zot/config.json"
        DESTINATION "/etc/zot")

install(FILES "oci-images/${IMAGE_TAR}"
        DESTINATION "${IMAGE_DEST_DIR}")
