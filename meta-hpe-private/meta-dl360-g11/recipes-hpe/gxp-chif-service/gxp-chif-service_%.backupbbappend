FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# platform configuration files
SRC_URI += "file://uefievs.store"
SRC_URI_append = " file://uefievs.store"
FILES_${PN} += " /usr/share/uefi/*"

do_install_append() {
	mkdir -p ${D}/usr/share/uefi
        install -D ${WORKDIR}/uefievs.store ${D}/usr/share/uefi/uefievs.store
}
