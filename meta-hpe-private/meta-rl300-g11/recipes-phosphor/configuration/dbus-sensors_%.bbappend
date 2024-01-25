# SRC_URI = "git:///home/mystere/dbus-sensors;protocol=file;branch=ampere"
# SRCREV = "${AUTOREV}"

# PACKAGECONFIG:rl300-g11 = " \
#			fansensor \
#			hwmontempsensor \
#                        amperecpusensor \
#                        "

# PACKAGECONFIG[amperecpusensor] = "-Dampere-cpu=enabled, -Dampere-cpu=disabled"
# SYSTEMD_SERVICE:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'amperecpusensor', \
#                                                'xyz.openbmc_project.amperecpusensor.service', \
#                                               '', d)}"
