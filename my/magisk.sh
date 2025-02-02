MAGISK=../
TMP=/data/local/tmp
ADB_DEVICE=$1

extract_boot() {
    STOCK_BOOT=$1
    adb -s $ADB_DEVICE shell "dd if=/dev/block/bootdevice/by-name/boot of=$TMP/boot.img"
    adb -s $ADB_DEVICE pull $TMP/boot.img $STOCK_BOOT
}

# use 64
copy_magisk_files() {
    ARCH=$1
    CPU=$2
    #for f in $MAGISK/native/out/$CPU/*; do adb -s $ADB_DEVICE push $f $TMP/; done
    adb -s $ADB_DEVICE push $MAGISK/native/out/$ARCH/bushbox $TMP/
    adb -s $ADB_DEVICE push $MAGISK/native/out/$ARCH/magisk $TMP/magisk$CPU
    adb -s $ADB_DEVICE push $MAGISK/native/out/$ARCH/magiskboot $TMP/
    adb -s $ADB_DEVICE push $MAGISK/native/out/$ARCH/magiskinit $TMP/
    adb -s $ADB_DEVICE push $MAGISK/scripts/boot_patch.sh $TMP/boot_patch.sh
    adb -s $ADB_DEVICE push $MAGISK/scripts/util_functions.sh $TMP/
    adb -s $ADB_DEVICE push $MAGISK/app/build/outputs/apk/release/app-release.apk $TMP/magisk.apk
    #adb -s $ADB_DEVICE shell "chown shell $TMP/*"
}

reboot() {
    adb -s $ADB_DEVICE reboot bootloader
    fastboot boot $1
}

boot_patch() {
    STOCK_BOOT=$1
    MAGISK_BOOT=$2
    adb -s $ADB_DEVICE push $STOCK_BOOT $TMP/boot.img
    adb -s $ADB_DEVICE shell "cd /$TMP; chmod +x boot_patch.sh; ./boot_patch.sh boot.img"
    adb -s $ADB_DEVICE pull $TMP/new-boot.img $MAGISK_BOOT
}

pause(){
    read -s -n 1 -p "$1"
}
