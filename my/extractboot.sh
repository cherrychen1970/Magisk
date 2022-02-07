#!/system/bin/sh
TMP_DIR=/dev/tmp
# /data/local/tmp

mount_tmp() {
    mkdir $TMP_DIR
    mount -t tmpfs -o 'mode=0755' tmpfs $TMP_DIR
}

run_script() {
    adb -e push $1 $TMP_DIR/$1
    adb -e shell "sh $TMP_DIR/$1"
}

run_script ./target_extract_boot.sh
adb -e pull /data/local/tmp/ramdisk.img