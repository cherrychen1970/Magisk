DEVICE=../devices/pixel2
TWRP=$DEVICE/twrp-3.6.0_9-0-taimen.img
STOCK_BOOT=$DEVICE/stock_boot.img
MAGISK_BOOT=$DEVICE/magisk_boot.img

. ./magisk.sh 801KPRW1391270
############################################

if [ ! -f $STOCK_BOOT ]; then
    reboot $TWRP #(for root)
    pause "Entering TWRP....wait until TWRP is running... Press any key to continue when adb is ready..."
    extract_boot $STOCK_BOOT
    adb push ./magisk.db /data/adb/
    pause "Reboot to system from TWRP and wait adb is ready. Press any key to continue..."
fi

if [ ! -f $MAGISK_BOOT ]; then
    copy_magisk_files arm64-v8a
    boot_patch $STOCK_BOOT $MAGISK_BOOT
fi

reboot $MAGISK_BOOT
