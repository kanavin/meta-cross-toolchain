BBCLASSEXTEND += "mcextend:arm-none-eabi"

BPN:virtclass-mcextend-arm-none-eabi = "binutils"
TARGET_ARCH:virtclass-mcextend-arm-none-eabi = "arm"
TARGET_VENDOR:virtclass-mcextend-arm-none-eabi = "-none"
TARGET_OS:virtclass-mcextend-arm-none-eabi = "eabi"

HOST_ARCH:virtclass-mcextend-arm-none-eabi = "${TUNE_ARCH}"
HOST_VENDOR:virtclass-mcextend-arm-none-eabi = "-poky"
HOST_OS:virtclass-mcextend-arm-none-eabi = "linux${LIBCEXTENSION}${ABIEXTENSION}"
HOST_PREFIX:virtclass-mcextend-arm-none-eabi = "${HOST_SYS}-"

PATH:prepend:virtclass-mcextend-arm-none-eabi = "${STAGING_DIR_NATIVE}${bindir_native}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}:"

EXTRA_OECONF:append:virtclass-mcextend-arm-none-eabi = " --disable-shared"

oe_multilib_header:virtclass-mcextend-arm-none-eabi () {
        return
}

do_install:virtclass-mcextend-arm-none-eabi () {
        autotools_do_install
}

PACKAGE_BEFORE_PN:virtclass-mcextend-arm-none-eabi = ""

FILES:${PN}:append:virtclass-mcextend-arm-none-eabi = " ${libdir}/ldscripts/*"
FILES:${PN}-dev:append:virtclass-mcextend-arm-none-eabi = " ${prefix}/*/*/include/*.h"
FILES:${PN}-staticdev:append:virtclass-mcextend-arm-none-eabi = " ${libdir}/*/*.a ${prefix}/*/*/lib/*.a"
