FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# platform configuration files
SRC_URI += "file://dl325g10p.json"

do_install_append() {
	install -D ${WORKDIR}/dl325g10p.json ${D}${datadir}/${BPN}/configurations/dl325g10p.json
}
