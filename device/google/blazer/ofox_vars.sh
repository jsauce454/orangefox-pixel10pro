#
# OrangeFox build variables for blazer (Pixel 10 Pro)
# Ported from husky (Pixel 8 Pro)
# Updated for Android 16 (fox_16.0-R12)
#

# Android 16 specific
export OF_USE_GREEN_EXTRACTION="true"
export OF_USE_MAGISKBOOT="true"
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="true"
export OF_SKIP_MAGISK_DETECTION="true"

# Update version
export OF_VERSION="R12"
export OF_VERSION_NAME="16.0"

# Pixel 10 Pro: 6.3" 1280x2856 — adjusted screen height for UI
export OF_SCREEN_H=2142

export OF_STATUS_H=130
export OF_STATUS_INDENT_LEFT=80
export OF_STATUS_INDENT_RIGHT=80
export OF_HIDE_NOTCH=1
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CLOCK_POS=1
export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
export OF_USE_GREEN_LED=0

export OF_QUICK_BACKUP_LIST=""
export OF_ENABLE_LPTOOLS=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1

# TODO_VERIFY: Super partition size for blazer — confirm via fastboot getvar
export OF_DYNAMIC_FULL_SIZE=8531214336

export OF_OPTIONS_LIST_NUM=6
export OF_UNBIND_SDCARD_F2FS=1
export OF_BIND_MOUNT_SDCARD_ON_FORMAT=1
export OF_USE_LZ4_COMPRESSION=1
export OF_DEFAULT_KEYMASTER_VERSION=5.0

# Pixel 10 family codenames
export TARGET_DEVICE_ALT="blazer,mustang,frankel"
export FOX_TARGET_DEVICES="blazer,mustang,frankel"

export FOX_VARIANT=default
export OF_MAINTAINER=LeeGarChat

export FOX_VENDOR_BOOT_RECOVERY=1
export FOX_VIRTUAL_AB_DEVICE=1
export FOX_AB_DEVICE=1

# Pixel 10 Pro (deepspace) UFS controller address
# VERIFIED: From /sys/devices/platform/ on actual Pixel 10 Pro device
export FOX_RECOVERY_VENDOR_BOOT_PARTITION="/dev/block/platform/3c400000.ufs/by-name/vendor_boot"

# Use prebuilt kernel (no kernel config extraction)
export OF_FORCE_PREBUILT_KERNEL=1

export FOX_USE_TAR_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_USE_LZ4_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_ZSTD_BINARY=1

export OF_USE_LEGACY_BATTERY_SERVICES=0

export FOX_VANILLA_BUILD=0
export FOX_ENABLE_APP_MANAGER=1
export FOX_DELETE_AROMAFM=1
export OF_DONT_KEEP_LOG_HISTORY=0
export FOX_INSTALLER_DISABLE_AUTOREBOOT=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=0
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_BASH_TO_SYSTEM_BIN=1

export OF_NO_SPLASH_CHANGE=1
export OF_RECOVERY_AB_FULL_REFLASH_RAMDISK=1

# Android 16 specific updates
export OF_QUICK_BACKUP_LIST="" # Disable quick backup for Android 16
export OF_USE_TWRP_SAR_DETECT="true" # Enable SAR detection for Android 16