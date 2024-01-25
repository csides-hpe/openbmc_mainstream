

python do_patch_append() {

    import re

    regex = r"(eeprom_module:.*)(@55)(.*)(24c32)(.*)(0x55)"
    subst = "\\g<1>@50\\g<3>24c02\\g<5>0x50"

    workdir = d.getVar('S', True)
    file = os.path.join(workdir, 'arch/arm/dts/gxp.dts')

    with open(file, "r+") as dtsFile:
        data = dtsFile.read()
        dtsFile.seek(0)
        dtsFile.truncate()

        result = re.sub(regex, subst, data, 0, re.DOTALL)
        dtsFile.write(result)
}
