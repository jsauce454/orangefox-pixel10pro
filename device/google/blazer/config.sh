#!/bin/bash

# Device
export FOX_BRANCH="fox_14.1"
export DT_LINK="https://github.com/jsauce454/twrp_device_google_blazer.git -b fox_14.1"

export DEVICE="blazer"
export OEM="google"

# Build Target
export TARGET="vendorbootimage"
export TARGET_PRODUCT="twrp_blazer-eng"
export OUTPUT="OrangeFox*.zip"

# Additional Dependencies (eg: Kernel Source)
# Format: "repo dest"
DEPS=(
    "https://github.com/OrangeFoxRecovery/Avatar.git misc"
)

# Extra Command
export EXTRA_CMD="export OF_MAINTAINER=LeeGarChat"

# Magisk
## Use the Latest Release of Magisk for the OrangeFox addon
export OF_USE_LATEST_MAGISK=true

# Android 16 specific
export OF_USE_GREEN_EXTRACTION="true"
export OF_USE_MAGISKBOOT="true"
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="true"
export OF_SKIP_MAGISK_DETECTION="true"

# Android 16 specific flags
export OF_DISABLE_MIUI_SPECIFIC_FEATURES="true"
export OF_QUICK_BACKUP_LIST=""
export OF_USE_TWRP_SAR_DETECT="true"

# A/B Device
export FOX_AB_DEVICE=1

# Not Recommended to Change
export SYNC_PATH="$HOME/fox_14.1"
export USE_CCACHE=1
export CCACHE_SIZE="50G"
export CCACHE_DIR="$HOME/work/.ccache"
export J_VAL=16
