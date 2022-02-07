DEVICE=../devices/pixel2
TWRP=$DEVICE/twrp-3.6.0_9-0-taimen.img
STOCK_BOOT=$DEVICE/stock_boot.img
MAGISK_BOOT=$DEVICE/magisk_boot.img

. ./magisk.sh 801KPRW1391270
############################################

reboot $TWRP #(for root)
pause "Entering TWRP....wait until TWRP is running... Press any key to continue when adb is ready..."
extract_boot $STOCK_BOOT
# boot to normal
# adb reboot bootloader
pause "Reboot to system from TWRP and wait adb is ready. Press any key to continue..."
copy_magisk_files arm64-v8a
boot_patch $STOCK_BOOT $MAGISK_BOOT

reboot $MAGISK_BOOT
echo "Magisk installatiion done!"
