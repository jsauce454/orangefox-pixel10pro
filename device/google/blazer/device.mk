#
# Copyright (C) 2024-2025 The Android Open Source Project
# Copyright (C) 2024-2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += build.variant.self=$(BUILD_VATIANT_SELF)

DEVICE_PATH := device/google/blazer

PLATFORM_SECURITY_PATCH := 2099-12-31

VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="blazer-user 16 BP4A.260205.001 release-keys" \
    BuildFingerprint=google/blazer/blazer:16/BP4A.260205.001:user/release-keys \
    DeviceProduct=blazer

PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
PLATFORM_VERSION := 14.0.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Android 16 = API 36 (using highest supported SDK version 34 for compatibility)
PRODUCT_SHIPPING_API_LEVEL := 34
PRODUCT_TARGET_VNDK_VERSION := 34
TARGET_VNDK_VERSION := 34

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Required for first stage ramdisk
PRODUCT_PACKAGES += linker.vendor_ramdisk
PRODUCT_PACKAGES += linker_hwasan64.vendor_ramdisk
PRODUCT_PACKAGES += resize2fs.vendor_ramdisk
PRODUCT_PACKAGES += resize.f2fs.vendor_ramdisk
PRODUCT_PACKAGES += dump.f2fs.vendor_ramdisk
PRODUCT_PACKAGES += defrag.f2fs.vendor_ramdisk
PRODUCT_PACKAGES += fsck.vendor_ramdisk
PRODUCT_PACKAGES += tune2fs.vendor_ramdisk
# TODO_VERIFY: fstab package name — should match the platform (deepspace)
PRODUCT_PACKAGES += fstab.deepspace.vendor_ramdisk
PRODUCT_PACKAGES += e2fsck.vendor_ramdisk

PRODUCT_PACKAGES += update_engine
PRODUCT_PACKAGES += update_engine_sideload
PRODUCT_PACKAGES += update_verifier

# Boot control HAL — pixel source from bootctrl/1.2
PRODUCT_PACKAGES += android.hardware.boot@1.2-service-pixel
PRODUCT_PACKAGES += android.hardware.boot@1.2-impl-pixel

PRODUCT_PACKAGES += fastbootd

PRODUCT_PACKAGES += libsysutils
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libsysutils.so

TARGET_RECOVERY_DEVICE_MODULES += libion
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

BOARD_USES_METADATA_PARTITION := true

PRODUCT_PACKAGES += libtrusty

PRODUCT_PACKAGES += vndservicemanager
PRODUCT_PACKAGES += vndservice

PRODUCT_PACKAGES += libhidltransport.vendor

DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/system/etc/vintf/manifest.xml
PRODUCT_ENFORCE_VINTF_MANIFEST := true

PRODUCT_PACKAGES += bootctl
PRODUCT_PACKAGES += logcat
PRODUCT_PACKAGES += logd
PRODUCT_PACKAGES += auditctl
PRODUCT_PACKAGES += libcap

ENABLE_VIRTUAL_AB := true
