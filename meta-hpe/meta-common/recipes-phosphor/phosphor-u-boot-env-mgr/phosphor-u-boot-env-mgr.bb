#
# This file was derived from the 'Hello World!' example recipe in the
# Yocto Project Development Manual.
#

DESCRIPTION = "phosphor-u-boot-env-mgr recipe"
SECTION = "examples"
DEPENDS = "boost dbus sdbusplus phosphor-dbus-interfaces phosphor-logging"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${HPEBASE}/COPYING.apache-2.0;md5=34400b68072d710fecd0a2940a0d1658"

#LICENSE = "MIT"
#LIC_FILES_CHKSUM = "file://LICENSE;md5=96af5705d6f64a88e035781ef00e98a8"

#FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-${PV}:"


SRCREV = "77fad7bc0f3b4afbb1e3c3176ae6dd4cf0a8d967"
SRC_URI = "git://git@github.com/openbmc/phosphor-u-boot-env-mgr;branch="master";protocol=https"

#S = "${WORKDIR}/git"

inherit autotools cmake pkgconfig systemd


#do_install() {
#        install -d ${D}${bindir}
#}

SYSTEMD_SERVICE:${PN} += "xyz.openbmc_project.U_Boot.Environment.Manager.service"

# The autotools configuration I am basing this on seems to have a problem with a race condition when parallel make is enabled
PARALLEL_MAKE = ""

#FILES:${PN}:append = "/lib" \
#			"/lib/systemd" \
#			"/lib/systemd/system" \
#			"/lib/systemd/system/xyz.openbmc_project.U_Boot.Environment.Manager.service"

