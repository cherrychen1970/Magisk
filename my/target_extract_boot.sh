
TMP_DIR=/data/local/tmp
RAMDISK=$TMP_DIR/ramdisk.img

  echo "[*] Moving out patched boot.img .."
  mv /sdcard/Download/magisk_patched*.img $TMP_DIR/boot.img

  if [ -f $TMP_DIR/boot.img ]; then
    echo "[*] Extracting ramdisk .."
    rm -f ${RAMDISK}.gz
    dd if=$TMP_DIR/boot.img of=$RAMDISK bs=2048 skip=1
    gzip $RAMDISK
    mv ${RAMDISK}.gz $RAMDISK
  else
    echo "[!] boot.img not found. "
  fi