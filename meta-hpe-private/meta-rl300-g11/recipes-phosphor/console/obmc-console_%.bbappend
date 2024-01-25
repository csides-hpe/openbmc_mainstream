FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://80-gxp-obmc-console-uart.rules"

SYSTEMD_SERVICE_${PN} += " obmc-console@ttyS1.service"

do_install_append() {
        install -d ${D}/lib/udev/rules.d
        rm -f ${D}/lib/udev/rules.d/80-obmc-console-uart.rules
        rm -f ${D}/etc/obmc-console.conf
        install -m 0644 ${WORKDIR}/80-gxp-obmc-console-uart.rules ${D}/lib/udev/rules.d
        install -m 0644 ${WORKDIR}/obmc-console.conf ${D}/etc
	rm -f ${D}/etc/obmc-console/*
	ln -s ../obmc-console.conf ${D}/etc/obmc-console/server.ttyS1.conf
}

