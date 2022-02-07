SYSTEM_RAMDISK=~/Library/Android/sdk/system-images/android-31/google_apis/x86_64/ramdisk.img
#adb -e push $SYSTEM_RAMDISK /data/local/tmp/ramdisk.img.gz
#adb -e shell "gzip -fd /data/local/tmp/ramdisk.img.gz"

#cp $SYSTEM_RAMDISK ../devices/emulator/android31/ramdisk.img.gz
#gzip -fd ../devices/emulator/android31/ramdisk.img.gz