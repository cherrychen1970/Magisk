#TMP_DIR=/dev/tmp
SYSTEM_RAMDISK=~/Library/Android/sdk/system-images/android-29/google_apis/x86_64/ramdisk.img
AVD=pixel4
DEVICE=../devices/emulator/pixel4
ADB_DEVICE=emulator-5554
TMP_DIR=/data/local/tmp

RAMDISK=$DEVICE/ramdisk.img
STOCK_BOOT=$DEVICE/boot.img
MAGISK_BOOT=$DEVICE/magisk_boot.img
MAGISK_RAMDISK=$DEVICE/magisk_ramdisk.img

[ ! -f $RAMDISK ] && cp $SYSTEM_RAMDISK $RAMDISK

# import
. ./magisk.sh $ADB_DEVICE

# extracing from ramdisk
extract_boot() {
    adb -e push $1 $TMP_DIR/ramdisk.img
    adb -e shell "sh $TMP_DIR/target.sh extract_boot $TMP_DIR/ramdisk.img $TMP_DIR/boot.img"
    adb -e pull $TMP_DIR/boot.img $2
}

# repack boot.img => ramdisk.img
repack_ramdisk() {
    adb -e push $1 $TMP_DIR/boot.img
    adb -e shell "sh $TMP_DIR/target.sh repack_ramdisk $TMP_DIR/boot.img $TMP_DIR/ramdisk.img"
    adb -e pull $TMP_DIR/ramdisk.img $2
}

pause(){
    read -s -n 1 -p "$1"
}

#emulator -avd $AVD
adb -e push ./target.sh $TMP_DIR/target.sh
extract_boot $RAMDISK $STOCK_BOOT
copy_magisk_files x86_64
boot_patch $STOCK_BOOT $MAGISK_BOOT
repack_ramdisk $MAGISK_BOOT $MAGISK_RAMDISK
pause "Close emulator and press any key to continue ....."
emulator -avd pixel4 -ramdisk $DEVICE/ramdisk.img

