HOMEPAGE = "https://github.com/HewlettPackard/gxp-uboot"
DEPENDS += "flex-native bison-native bc-native"

LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
PE = "1"

# We use the revision in order to avoid having to fetch it from the
# repo during parse
SRCREV = "dfbf9f857270b518162ac009a3daeacc3cc8de83"
UBRANCH = "add_v_eeprom"
SRC_URI = "git://git@github.hpe.com/hpe-iop/gxp-uboot.git;branch=${UBRANCH};protocol=ssh"

S = "${WORKDIR}/git"

PV = "v2020.10+git${SRCPV}"
