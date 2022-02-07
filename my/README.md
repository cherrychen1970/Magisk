### fastboot commands
```
fastboot devices	Check whether the device is detected and recognized by the computer
fastboot reboot	Reboot the Android devices into the recovery mode
fastboot oem unlock	Unlock the bootloader on with fastboot OEM unlock
fastboot oem lock	After unlocking the command, relock it using this command
fastboot reboot recovery	Reboot the device into recovery
fastboot reboot bootloader	When you reboot the bootloader or fastboot without flashing the images, this command will help.
fastboot flash boot	This command can be used for flashing boot.img
fastboot boot image_file.img	Want to just boot your device temporarily into custom recovery mode without flashing? Use this command.
fastboot format:ex4 userdata	To erase your device’s data, this command will be used.
fastboot erase	Fastboot erase command will erase items from your device. You can wipe data from different partitions on your device.
```

### adb commands
```
ADB shell	Allows access to Unix shell to write commands
ADB reboot bootloader	Boot the device to fastboot or Bootloader mode, use this command.
ADB reboot recovery	Boots your device to TWRP or stock recovery from the booted OS.
adb pull /file-location-on-device/filename	To ‘pull’ any file from your device and send it over to PC
ADB shell wm density	This command overrides display density
adb sideload filename	Allow flashing zip files from a command shell
adb start-server	If the ADB server does not start automatically “kills the daemon” and “start on a specific port”, use this command to start the ADB server
adb kill-server	You may kill the server if the command tool gets hanged or isn’t performing as per your expectations.
adb install filename.apk	Install an APK file on your device.
adb install -r filename.apk	This adb command will allow you to reinstall or update an APK
adb install -s filename.apk	To move the application to SD card (if supported by your device):
```

### magisk

native/out/arm64-v8a