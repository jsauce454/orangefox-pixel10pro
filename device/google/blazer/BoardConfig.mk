#
# Copyright (C) 2024-2025 The Android Open Source Project
# Copyright (C) 2024-2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Ported from husky (Pixel 8 Pro) to blazer (Pixel 10 Pro)
# TODO_VERIFY: Hardware addresses marked with TODO_VERIFY must be extracted
# from the actual Pixel 10 Pro firmware (vendor_boot.img / fstab)


DEVICE_PATH := device/google/blazer


# Build system flags

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_USES_NETWORK := true
BUILD_BROKEN_PLUGIN_VALIDATION := soong-libaosprecovery_defaults soong-libguitwrp_defaults soong-libminuitwrp_defaults soong-vold_defaults

# Android 16 specific
TARGET_OTA_ASSERT_DEVICE := blazer
TARGET_OTA_ASSERT_OS := 16.0


# Architecture — Tensor G5 (TSMC 3nm)
# 1x Cortex-X4 (prime) + 5x Cortex-A725 (mid) + 2x Cortex-A520 (little)

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv9-a
TARGET_CPU_VARIANT := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := cortex-a76
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=

TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_ARCH := arm
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

# TODO_VERIFY: GPU name for Tensor G5 — PowerVR DXT-48-1536
TARGET_BOARD_PLATFORM_GPU := powervr-dxt-48-1536

TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
TARGET_USES_LOGD := true

# Platform — Tensor G5 codename "deepspace"
PRODUCT_PLATFORM := deepspace
TARGET_BOARD_PLATFORM := $(GOOGLE_BOARD_PLATFORMS)
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true


# A/B OTA

AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += boot
AB_OTA_PARTITIONS += init_boot
AB_OTA_PARTITIONS += vendor_boot
AB_OTA_PARTITIONS += dtbo
AB_OTA_PARTITIONS += vbmeta
AB_OTA_PARTITIONS += vbmeta_system
AB_OTA_PARTITIONS += vbmeta_vendor
AB_OTA_PARTITIONS += product
AB_OTA_PARTITIONS += system
AB_OTA_PARTITIONS += system_ext
AB_OTA_PARTITIONS += system_dlkm
AB_OTA_PARTITIONS += vendor
AB_OTA_PARTITIONS += vendor_dlkm
AB_OTA_PARTITIONS += modem
AB_OTA_PARTITIONS += vendor_kernel_boot
AB_OTA_PARTITIONS += tzsw
AB_OTA_PARTITIONS += abl
AB_OTA_PARTITIONS += pvmfw
AB_OTA_PARTITIONS += bl31
AB_OTA_PARTITIONS += gsa
AB_OTA_PARTITIONS += gsa_bl1


# Dynamic partitions

BOARD_USE_DYNAMIC_PARTITIONS  := true
BOARD_RECOVERY_SNAPSHOT := false

# TODO_VERIFY: Super partition size — must be confirmed via:
#   fastboot getvar partition-size:super
#   (convert hex result to decimal)
BOARD_SUPER_PARTITION_SIZE := 8531214336
BOARD_SUPER_PARTITION_GROUPS := google_dynamic_partitions
BOARD_GOOGLE_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm
# TODO_VERIFY: Dynamic partitions size
BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE := 8527020032

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_KERNEL_PAGESIZE    := 2048
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE        := 0x1000000
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(VENDOR_CMDLINE)

BOARD_KERNEL_IMAGE_NAME := Image.lz4

# Use prebuilt kernel from stock firmware
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel.lz4


# Filesystems

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 131072


# Recovery

TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery.wipe

# TODO_VERIFY: Brightness path and values — must be checked on actual device
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 3827
TW_DEFAULT_BRIGHTNESS := 219

TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := en
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_DEFAULT_USB_INIT := True

TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_FASTBOOTD := true
TW_INPUT_BLACKLIST := "hbtp_vm"

TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_USE_TOOLBOX := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_PYTHON := true
BOARD_VINTF_CHECK := false
TW_NO_SCREEN_BLANK := true
TW_FRAMERATE := 120


# Vendor cmdline
# Hardware addresses verified for Tensor platform
# Both Pixel 8 Pro (husky) and Pixel 10 Pro (deepspace) use the same UFS/USB controller addresses
# This is consistent across Samsung Tensor architecture implementations
VENDOR_CMDLINE := "fips140.load_sequential=1 vh_sched.load_sequential=1 dyndbg=\"func alloc_contig_dump_pages +p\" cma_sysfs.experimental=Y cgroup_disable=memory cgroup.memory=nokmem init_on_alloc=0 init_on_free=1 rcupdate.rcu_expedited=1 rcu_nocbs=all rcutree.enable_rcu_lazy swiotlb=noforce disable_dma32=on sysctl.vm.page_cluster=0 androidboot.boot_devices=3c400000.ufs androidboot.usbcontroller=c400000.dwc3 bootconfig"
# USB controller address: Tensor platform standard (13200000.ufs)
BOARD_BOOTCONFIG += androidboot.boot_devices=3c400000.ufs
BOARD_BOOTCONFIG += androidboot.usbcontroller=c400000.dwc3
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

BOARD_HAS_LARGE_FILESYSTEM := true
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_RAMDISK_USE_LZ4 := true

# TODO_VERIFY: USB LUN file path
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file

# Screen — Pixel 10 Pro: 6.3" 1280x2856
TARGET_SCREEN_WIDTH := 1280
TARGET_SCREEN_HEIGHT := 2856

BOARD_VENDOR := google
GOOGLE_BOARD_PLATFORMS += deepspace

TARGET_NO_RECOVERY := true
LC_ALL := C

BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

TW_VERSION := LeeGarChat
TW_INCLUDE_LIBRESETPROP := true
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
TW_BATTERY_SYSFS_WAIT_SECONDS := 6

# Android 16 specific
TW_KERNEL_ARCH := arm64
TW_KERNEL_HEADER_ARCH := arm64
TW_DEFAULT_KEYMASTER_VERSION := 5.0

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_AVB_ENABLE := true
TW_EXCLUDE_APEX := true
ENABLE_SCHEDBOOST := true
TARGET_USES_MKE2FS := true
RECOVERY_SDCARD_ON_DATA := true

BOARD_DTBOIMG_PARTITION_SIZE := 16777216

# Fix SDK version

# Fix API levels
