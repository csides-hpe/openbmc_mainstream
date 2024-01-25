SUMMARY = "Seaport GXP bootblock"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

# The gxp-bootblock-seaport.bin is closed source. Contact the HPE OpenBMC development
# team for a copy. Manually copy it here:
HPE_SEAPORT_FILES_DIR = "${COREBASE}/meta-hpe/meta-gxp/recipes-bsp/image/files"

inherit deploy

do_deploy () {

  [ ! -f "${HPE_SEAPORT_FILES_DIR}/gxp-bootblock-seaport.bin" ] && \
    echo "\nContact the HPE OpenBMC dev team for a copy of gxp-bootblock-seaport.bin."  && \
    echo "Place it in ${HPE_SEAPORT_FILES_DIR}/" && \
    exit 1

  install -d ${DEPLOYDIR}

  # Copy in the bootblock
  install -m 644 ${HPE_SEAPORT_FILES_DIR}/gxp-bootblock-seaport.bin ${DEPLOYDIR}/gxp-bootblock.bin

}

addtask deploy before do_build after do_compile

