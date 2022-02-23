BBCLASSEXTEND += "mcextend:arm-none-eabi"

TARGET_ARCH:virtclass-mcextend-arm-none-eabi = "arm"
TARGET_VENDOR:virtclass-mcextend-arm-none-eabi = "-none"
TARGET_OS:virtclass-mcextend-arm-none-eabi ="eabi"

HOST_ARCH:virtclass-mcextend-arm-none-eabi = "${TUNE_ARCH}"
HOST_VENDOR:virtclass-mcextend-arm-none-eabi = "-poky"
HOST_OS:virtclass-mcextend-arm-none-eabi ="linux${LIBCEXTENSION}${ABIEXTENSION}"
HOST_PREFIX:virtclass-mcextend-arm-none-eabi = "${HOST_SYS}-"

PATH:prepend:virtclass-mcextend-arm-none-eabi = "${STAGING_DIR_NATIVE}${bindir_native}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}:"
DEPENDS:append:virtclass-mcextend-arm-none-eabi = " gcc-cross-arm-none-eabi"

# gcc proper already has it set in global securty config
SECURITY_STRINGFORMAT:virtclass-mcextend-arm-none-eabi = ""

do_install:append:virtclass-mcextend-arm-none-eabi () {
    rm -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h
}

# Everything must be prefixed with ${PN} to avoid clashes with plain gcc
PACKAGES:virtclass-mcextend-arm-none-eabi = "\
    ${PN} ${PN}-plugins ${PN}-symlinks \
    ${PN}-g++ ${PN}-g++-symlinks \
    ${PN}-cpp ${PN}-cpp-symlinks \
    ${PN}-g77 ${PN}-g77-symlinks \
    ${PN}-gfortran ${PN}-gfortran-symlinks \
    ${PN}-gcov ${PN}-gcov-symlinks \
    ${PN}-doc \
    ${PN}-dev \
    ${PN}-dbg \
"

RDEPENDS:${PN}:virtclass-mcextend-arm-none-eabi = "${PN}-cpp"

FILES:${PN}-cpp = "\
    ${bindir}/${TARGET_PREFIX}cpp* \
    ${base_libdir}/cpp \
    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
FILES:${PN}-cpp-symlinks = "${bindir}/cpp"

FILES:${PN}-gcov = "${bindir}/${TARGET_PREFIX}gcov* \
    ${bindir}/${TARGET_PREFIX}gcov-tool* \
"
FILES:${PN}-gcov-symlinks = "${bindir}/gcov \
    ${bindir}/gcov-tool \
"

FILES:${PN}-g++ = "\
    ${bindir}/${TARGET_PREFIX}g++* \
    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
"
FILES:${PN}-g++-symlinks = "\
    ${bindir}/c++ \
    ${bindir}/g++ \
"
