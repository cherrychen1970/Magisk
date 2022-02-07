  
  
RAMDISK=/data/local/tmp/ramdisk.img
  # extract and check ramdisk
gzip -fd ${RAMDISK}.gz
if [[ $? -ne 0 ]]; then
  echo "[-] Failed to unzip ramdisk, just use it .."
  mv ${RAMDISK}.gz ${RAMDISK}
  TRY_LZ4=1
fi


writehex() {
  printf "\x${1:6:2}\x${1:4:2}\x${1:2:2}\x${1:0:2}"
}

  echo "[*] Build fake boot.img .."

  BOOT_IMG=/sdcard/boot.img
  RAMDISK_SIZE="$(printf '%08x' $(stat -c%s $RAMDISK))"
echo $RAMDISK_SIZE
  rm -f $BOOT_IMG

  # build fake header of boot.img
  printf "\x41\x4E\x44\x52\x4F\x49\x44\x21\x00\x00\x00\x00\x00\x80\x00\x10" >> $BOOT_IMG
  writehex $RAMDISK_SIZE >> $BOOT_IMG
  printf "\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\xF0\x10\x00\x01\x00\x10\x00\x08\x00\x00" >> $BOOT_IMG

  # padding to 2048 bytes (header)
  i=0
  while [[ $i -lt 251 ]];
  do
    printf "\x00\x00\x00\x00\x00\x00\x00\x00" >> $BOOT_IMG
    i=$(($i+1))
  done
  
  # append ramdisk right after header
  cat $RAMDISK >> $BOOT_IMG

  echo "[*] boot.img is ready, launch MagiskManager and patch it."