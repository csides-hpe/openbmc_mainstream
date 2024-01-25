FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

EXTRA_OECONF_append_evb-t261 = " --enable-negative-errno-on-fail"

NAMES = " \
        "

ITEMSFMT = "ahb@80000000/{0}.conf"

ITEMS = "${@compose_list(d, 'ITEMSFMT', 'NAMES')}"

ENVS = "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE_${PN} += "${@compose_list(d, 'ENVS', 'ITEMS')}"
