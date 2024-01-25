FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# platform configuration files
SRC_URI += "file://rl300-g11.json"

do_install_append() {
	install -D ${WORKDIR}/rl300-g11.json ${D}${datadir}/${BPN}/configurations/rl300-g11.json
}
