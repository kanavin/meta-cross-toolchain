BBCLASSEXTEND += "mcextendcross:arm-none-eabi"

TARGET_ARCH:virtclass-mcextendcross-arm-none-eabi = "arm"
TARGET_VENDOR:virtclass-mcextendcross-arm-none-eabi = "-none"
TARGET_OS:virtclass-mcextendcross-arm-none-eabi = "eabi"

PN:virtclass-mcextendcross-arm-none-eabi = "gcc-cross-${TARGET_SYS}"
DEPENDS:virtclass-mcextendcross-arm-none-eabi = "binutils-cross-arm-none-eabi ${EXTRADEPENDS} ${NATIVEDEPS}"
PROVIDES:virtclass-mcextendcross-arm-none-eabi = ""

GCCMULTILIB:virtclass-mcextendcross-arm-none-eabi = "--enable-multilib --with-multilib-list=rmprofile,aprofile"

do_compile:append:virtclass-mcextendcross-arm-none-eabi () {
        oe_runmake all-host all-target-libgcc
}

do_install:append:virtclass-mcextendcross-arm-none-eabi () {
        oe_runmake 'DESTDIR=${D}' install-target-libgcc
}

EXTRA_OECONF:append:virtclass-mcextendcross-arm-none-eabi = " --with-sysroot= --with-headers=no --disable-gcov --disable-threads"

do_gcc_stash_builddir:virtclass-mcextendcross-arm-none-eabi () {
}
