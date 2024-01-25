LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

# TODO:  Manually copy the U-Boot signing key and customer-key-block here:
HPE_GXP_KEY_FILES_DIR = "${COREBASE}/meta-hpe/meta-gxp/recipes-bsp/image/files"

KBRANCH = "t265-secure-boot"

SRC_URI = "git://git@github.hpe.com/hpe-iop/iop-bootblock.git;protocol=ssh;branch=${KBRANCH}"
#SRCREV = "dbe6ed9f615385a2c690857e00a0801e3545257a"
SRCREV = "1c082a8d6a3ab7249ce23ea45ceb5f6a6b2ebe2c"
S = "${WORKDIR}/git"

inherit deploy

do_deploy () {
  install -d ${DEPLOYDIR}

  # Copy in the bootblock
  install -m 644 GXP2loader-t26x-sgn00.bin ${DEPLOYDIR}/gxp-bootblock.bin

  # Copy in files from the files subdirectory
  install -m 644 ${HPE_GXP_KEY_FILES_DIR}/header.sig ${DEPLOYDIR}/hpe-uboot-header.section
  install -m 644 ${HPE_GXP_KEY_FILES_DIR}/header-512.sig ${DEPLOYDIR}/hpe-uboot-header-512.section

  # Copy in the U-Boot signing key
  install -m 644 ${HPE_GXP_KEY_FILES_DIR}/private_key.pem ${DEPLOYDIR}/hpe-uboot-signing-key.pem

  # Copy in the customer keyblock
  install -m 644 ${HPE_GXP_KEY_FILES_DIR}/customer-key-block ${DEPLOYDIR}/customer-key-block
}

addtask deploy before do_build after do_compile

