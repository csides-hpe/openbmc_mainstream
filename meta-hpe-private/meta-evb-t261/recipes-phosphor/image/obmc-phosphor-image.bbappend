do_generate_hpe_image() {
    # Extract uboot 256K
    dd if=/dev/zero bs=1k count=256 > ${DEPLOY_DIR_IMAGE}/u-boot-tmp.${UBOOT_SUFFIX}
    dd bs=1k conv=notrunc seek=0 count=256\
            if=${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX} \
            of=${DEPLOY_DIR_IMAGE}/u-boot-tmp.${UBOOT_SUFFIX}

    # This machine build has a bootblock which doesn't validate U-Boot, so skip signing
    # in favor of a dummy 4KB block of zeroes
# UNUSED     # Sign uboot 256K
# UNUSED     openssl sha256 -sign ${DEPLOY_DIR_IMAGE}/${HPE_UBOOT_SIGNING_KEY} -out ${DEPLOY_DIR_IMAGE}/gxp_tmp.sig \
# UNUSED             ${DEPLOY_DIR_IMAGE}/u-boot-tmp.${UBOOT_SUFFIX}
# UNUSED
# UNUSED     # Expand (header+signature) to 4K
# UNUSED     cat ${DEPLOY_DIR_IMAGE}/${HPE_UBOOT_SIGNING_HEADER} ${DEPLOY_DIR_IMAGE}/gxp_tmp.sig \
# UNUSED          > ${DEPLOY_DIR_IMAGE}/gxp.sig
    dd if=/dev/zero bs=1k count=4 > ${DEPLOY_DIR_IMAGE}/gxp.sig

    # Add Header and Signature to hpe-section (from 60K)
    dd bs=1k conv=notrunc seek=60 \
          if=${DEPLOY_DIR_IMAGE}/gxp.sig \
          of=${DEPLOY_DIR_IMAGE}/hpe-section

    # Add ubb to hpe-section
    dd bs=1k conv=notrunc seek=64 \
          if=${DEPLOY_DIR_IMAGE}/${HPE_GXP_BOOTBLOCK_IMAGE} \
          of=${DEPLOY_DIR_IMAGE}/hpe-section

    # Expand uboot to 384K
    dd if=/dev/zero bs=1k count=384 > ${DEPLOY_DIR_IMAGE}/u-boot-tmp.${UBOOT_SUFFIX}
    dd bs=1k conv=notrunc seek=0 count=384\
            if=${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX} \
            of=${DEPLOY_DIR_IMAGE}/u-boot-tmp.${UBOOT_SUFFIX}

    # Remove unnecessary files
# UNUSED    rm ${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX} \
# UNUSED       ${DEPLOY_DIR_IMAGE}/gxp_tmp.sig \
# UNUSED       ${DEPLOY_DIR_IMAGE}/gxp.sig

    mv ${DEPLOY_DIR_IMAGE}/u-boot-tmp.${UBOOT_SUFFIX} ${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX}

    # Check uboot image size equals to 384K
    size="$(wc -c < "${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX}")"
    if [ ${size} -ne ${UBOOT_IMG_SIZE} ]
    then
      echo "ERROR: STATIC - uBoot image size ${size} incorrect. Please try it again."
      exit 1
    fi
}
