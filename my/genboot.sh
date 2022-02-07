
LOC=~/Library/Android/sdk/system-images/android-29/google_apis/x86_64
adb -e push $LOC/ramdisk.img /data/local/tmp/ramdisk.img.gz
adb -e push ./gen_fakeboot.sh /data/local/tmp/target_gen_boot.sh
adb -e shell "sh /data/local/tmp/target_gen_boot.sh"