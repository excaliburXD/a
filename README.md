# Costum Recovey device tree for Infinix Note 10 Pro (radiant)

## Status

Current state of features (from [here](https://twrp.me/faq/OfficialMaintainer.html)):

### Blocking checks

- [X] Correct screen/recovery size
- [X] Working Touch, screen
- [X] Backup to internal/microSD
- [X] Restore from internal/microSD
- [X] reboot to system
- [X] ADB

### Medium checks

- [X] update.zip sideload
- [X] UI colors (red/blue inversions)
- [X] Screen goes off and on
- [X] F2FS/EXT4 Support, exFAT/NTFS where supported
- [X] all important partitions listed in mount/backup lists
- [X] backup/restore to/from external (USB-OTG) storage
- [X] [backup/restore to/from adb](https://gerrit.omnirom.org/#/c/15943/)
- [X] decrypt /data
- [X] Correct date

### Minor checks

- [X] MTP export
- [X] reboot to bootloader
- [X] reboot to recovery
- [X] poweroff
- [X] battery level
- [X] temperature
- [X] input devices via USB (USB-OTG)
- [X] USB mass storage export
- [X] set brightness
- [X] vibrate
- [X] screenshot
- [X] partition SD card

## Building

```bash
source build/envsetup.sh
lunch twrp_radiant-eng
mka bootimage
```

## Thanks to

* ramabondanprakoso (Initial Base X695C)
* hoshiyomi
* all groups member radiant
* https://t.me/InfinixNote10PID
* guide flash costum Recovey
* https://t.me/infinixupdaterecovery/7
