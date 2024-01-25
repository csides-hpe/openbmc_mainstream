FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# platform configuration files
SRC_URI += "file://evb.json"
SRC_URI += "file://ml110g10.json"
SRC_URI += "file://dl380g10p_t265.json"

do_install:append() {
	install -D ${WORKDIR}/evb.json ${D}${datadir}/${BPN}/configurations/evb.json
	install -D ${WORKDIR}/ml110g10.json ${D}${datadir}/${BPN}/configurations/ml110g10.json
	install -D ${WORKDIR}/dl380g10p_t265.json ${D}${datadir}/${BPN}/configurations/dl380g10p_t265.json
}
