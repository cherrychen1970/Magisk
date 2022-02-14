![](docs/images/logo.png)

[![Downloads](https://img.shields.io/badge/dynamic/json?color=green&label=Downloads&query=totalString&url=https%3A%2F%2Fraw.githubusercontent.com%2Ftopjohnwu%2Fmagisk-files%2Fcount%2Fcount.json&cacheSeconds=1800)](https://raw.githubusercontent.com/topjohnwu/magisk-files/count/count.json)

#### This is not an officially supported Google product

## Introduction

Magisk is a suite of open source software for customizing Android, supporting devices higher than Android 5.0.<br>
Some highlight features:

- **MagiskSU**: Provide root access for applications
- **Magisk Modules**: Modify read-only partitions by installing modules
- **MagiskBoot**: The most complete tool for unpacking and repacking Android boot images
- **Zygisk**: Run code in every Android applications' processes

## Downloads

[Github](https://github.com/topjohnwu/Magisk/) is the only source where you can get official Magisk information and downloads.

[![](https://img.shields.io/badge/Magisk-v24.1-blue)](https://github.com/topjohnwu/Magisk/releases/tag/v24.1)
[![](https://img.shields.io/badge/Magisk%20Beta-v24.1-blue)](https://github.com/topjohnwu/Magisk/releases/tag/v24.1)
[![](https://img.shields.io/badge/Magisk-Canary-red)](https://raw.githubusercontent.com/topjohnwu/magisk-files/canary/app-debug.apk)

## Useful Links

- [Installation Instruction](https://topjohnwu.github.io/Magisk/install.html)
- [Magisk Documentation](https://topjohnwu.github.io/Magisk/)
- [Magisk Troubleshoot Wiki](https://www.didgeridoohan.com/magisk/HomePage) (by [@Didgeridoohan](https://github.com/Didgeridoohan))
- https://github.com/shakalaca/MagiskOnEmulator

- https://source.android.com/devices/bootloader/partitions/ramdisk-partitions


## Building and Development

- Magisk builds on any OS Android Studio supports. Install Android Studio and do the initial setups.
- Clone sources: `git clone --recurse-submodules https://github.com/topjohnwu/Magisk.git`
- Install Python 3.6+ \
  (Windows only: select **'Add Python to PATH'** in installer, and run `pip install colorama` after install)
- Configure to use the JDK bundled in Android Studio:
  - macOS: `export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"`
  - Linux: `export PATH="/path/to/androidstudio/jre/bin:$PATH"`
  - Windows: Add `C:\Path\To\Android Studio\jre\bin` to environment variable `PATH`
- Set environment variable `ANDROID_SDK_ROOT` to the Android SDK folder (can be found in Android Studio settings)
- Run `./build.py ndk` to let the script download and install NDK for you
- To start building, run `build.py` to see your options. \
  For each action, use `-h` to access help (e.g. `./build.py all -h`)
- To start development, open the project with Android Studio. The IDE can be used for both app (Kotlin/Java) and native (C++/C) sources.
- Optionally, set custom configs with `config.prop`. A sample `config.prop.sample` is provided.
- To sign APKs and zips with your own private keys, set signing configs in `config.prop`. For more info, check [Google's Documentation](https://developer.android.com/studio/publish/app-signing.html#generate-key).

## Extract boot.img from device 
 
```
dd if=/dev/block/bootdevice/by-name/boot of=/sdcard/boot.img
adb pull /sdcard/boot.img stock_boot.img
```

dd if=/dev/block/bootdevice/by-name/boot_a of=/sdcard/boot.img