BBCLASSEXTEND += "mcextend:arm-none-eabi"

TARGET_ARCH:virtclass-mcextend-arm-none-eabi = "arm"
TARGET_VENDOR:virtclass-mcextend-arm-none-eabi = "-none"
TARGET_OS:virtclass-mcextend-arm-none-eabi = "eabi"

DEPENDS:virtclass-mcextend-arm-none-eabi = "gcc-cross-arm-none-eabi"
POPULATESYSROOTDEPS:virtclass-mcextend-arm-none-eabi = ""
COMPILERDEP:virtclass-mcextend-arm-none-eabi = ""

python extract_stashed_builddir:virtclass-mcextend-arm-none-eabi () {
}

do_configure:virtclass-mcextend-arm-none-eabi () {
}

do_compile:virtclass-mcextend-arm-none-eabi () {
}

do_install:virtclass-mcextend-arm-none-eabi () {
    mkdir -p ${D}${libdir}
    cp -rf ${STAGING_LIBDIR_NATIVE}/arm-none-eabi/gcc ${D}${libdir}
}

FILES:${PN}:virtclass-mcextend-arm-none-eabi = "${libdir}/arm*"
FILES:${PN}-dev:virtclass-mcextend-arm-none-eabi = "${libdir}/gcc"
FILES:${PN}-staticdev:virtclass-mcextend-arm-none-eabi = "${libdir}/gcc/*/*/*.a"
