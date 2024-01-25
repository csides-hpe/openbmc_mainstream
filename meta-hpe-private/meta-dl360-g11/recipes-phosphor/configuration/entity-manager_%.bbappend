FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# platform configuration files
SRC_URI += "file://dl360-g11.json"

do_install:append() {
	install -D ${WORKDIR}/dl360-g11.json ${D}${datadir}/${BPN}/configurations/dl360-g11.json
}
