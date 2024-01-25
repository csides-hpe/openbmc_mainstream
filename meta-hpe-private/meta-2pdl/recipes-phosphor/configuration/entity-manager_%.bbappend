FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# platform configuration files
SRC_URI += "file://dl360g10.json \
            file://dl380g10.json \
           "

do_install_append() {
	install -D ${WORKDIR}/dl360g10.json ${D}${datadir}/${BPN}/configurations/dl360g10.json
	install -D ${WORKDIR}/dl360g10.json ${D}${datadir}/${BPN}/configurations/dl380g10.json
}
