LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

# TODO:  Manually copy the U-Boot signing key here:
# UNUSED HPE_GXP_KEY_FILES_DIR = "${COREBASE}/meta-hpe/meta-gxp/recipes-bsp/image/files"

KBRANCH = "t-open-r1-obmc"

SRC_URI = "git://git@github.hpe.com/hpe-iop/iop-bootblock.git;protocol=ssh;branch=${KBRANCH}"
SRCREV = "1e75938f36af2ee4765c4c1b3bc8ba6e8a727f12"
S = "${WORKDIR}/git"

inherit deploy

do_deploy () {
  install -d ${DEPLOYDIR}

  # Copy in the bootblock
  install -m 644 gxp-t-open-r1-bootblock.bin ${DEPLOYDIR}/gxp-bootblock.bin
}

addtask deploy before do_build after do_compile

