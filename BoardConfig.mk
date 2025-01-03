#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/infinix/radiant

# Boot with Recovery Ramdisk
BOARD_USES_RECOVERY_AS_BOOT := true

# AB
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    vendor \
    product \
    system_ext \
    boot \
    vbmeta_vendor \
    vbmeta_system

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := radiant,X695C

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6785
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6785
PRODUCT_PLATFORM := mt6785

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# AVB - Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Fixs Broken A11 DECRYPTION
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_INCLUDE_DTBO_IMG := true
TARGET_DTBO_CONFIG := dtbo_defconfig
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SUPPORTS_F2FS := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 7516192768
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 7516192768
BOARD_MAIN_PARTITION_LIST := \
	system \
	system_ext \
	vendor \
	product

# System as Root
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Recovery
RECOVERY_SDCARD_ON_DATA := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_USES_PREBUILT_DYNAMIC_PARTITIONS := true
TARGET_RECOVERY_FSTAB_VERSION := 2
TARGET_USES_FBE := true
TARGET_USES_FBE_2 := true
TARGET_INCLUDE_FBE_METADATA := true
TARGET_ENABLE_INLINE_CRYPTO := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := en
TW_EXTRA_LANGUAGES := true
TW_HAS_MTP := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true
TW_INCLUDE_REPACKTOOLS := true
TW_NO_TWRPAPP := true
TW_NO_SCREEN_TIMEOUT := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_FRAMERATE := 60
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_INCLUDE_FASTBOOTD := true
TW_SUPPORTS_AB := true
TW_HAS_SDCARD := true
TW_INCLUDE_LIBLP := true
TW_DEVICE_VERSION := Radiant-040125 | Gilanggegea

# Debug 
TWRP_INCLUDE_LOGCAT := false
TARGET_USES_LOGD := true

# StatusBar
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"

# Minimal depends
ALLOW_MISSING_DEPENDENCIES := true
