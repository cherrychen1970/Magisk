MAGISK=../
DEVICE=../devices/pixel2
TMP=/data/local/tmp

extract_boot() {
    adb shell "dd if=/dev/block/bootdevice/by-name/boot of=$TMP/boot.img"
    adb pull $TMP/boot.img $DEVICE/stock_boot.img
}

# use 64
install_magisk() {
    for f in $MAGISK/native/out/arm64-v8a/*; do adb push $f $TMP/; done
    adb push $MAGISK/scripts/boot_patch.sh $TMP/
    adb push $MAGISK/scripts/util_functions.sh $TMP/
}

reboot() {
    adb reboot bootloader
    fastboot boot $1
}

boot_patch() {
    adb shell "cd /$TMP; chmod +x boot_patch.sh; ./boot_patch.sh boot.img"
    adb pull $TMP/new-boot.img $DEVICE/magisk_boot.img
    reboot $DEVICE/magisk_boot.img
}
#reboot $DEVICE/twrp-3.6.0_9-0-taimen.img
boot_patch
#adb reboot