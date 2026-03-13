#!/sbin/bash
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024-2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# Pixel 10 Pro (blazer) - deepspace/Tensor G5 platform
declare -A blazer_value_prop=(
        ["ro.quick_start.device_id"]="blazer"
        ["ro.lineage.device"]="blazer"
        ["ro.crdroid.device"]="blazer"
        ["ro.product.system.device"]="blazer"
        ["ro.product.system.model"]="Pixel 10 Pro"
        ["ro.product.system.name"]="blazer"
        ["ro.system.build.fingerprint"]="google/blazer/blazer:16/BP4A.260205.001/14451019:user/release-keys"
        ["ro.build.display.id"]="blazer-eng 99.87.36 BP4A.260205.001 eng.leegar.20250301.000000 test-keys"
        ["ro.build.flavor"]="blazer-eng"
        ["ro.build.product"]="blazer"
        ["ro.build.description"]="blazer-user 16 BP4A.260205.001 14451019 release-keys"
        ["ro.display.series"]="Pixel 10 Pro"
        ["ro.product.vendor.device"]="blazer"
        ["ro.product.vendor.model"]="Pixel 10 Pro"
        ["ro.product.vendor.name"]="blazer"
        ["ro.product.model"]="Pixel 10 Pro"
        ["ro.vendor.build.fingerprint"]="google/blazer/blazer:16/BP4A.260205.001/14451019:user/release-keys"
        ["ro.product.board"]="blazer"
        ["ro.product.odm.device"]="blazer"
        ["ro.product.odm.model"]="Pixel 10 Pro"
        ["ro.product.odm.name"]="blazer"
        ["ro.odm.build.fingerprint"]="google/blazer/blazer:16/BP4A.260205.001/14451019:user/release-keys"
        ["ro.product.product.device"]="blazer"
        ["ro.product.product.model"]="Pixel 10 Pro"
        ["ro.product.product.name"]="blazer"
        ["ro.product.build.fingerprint"]="google/blazer/blazer:16/BP4A.260205.001/14451019:user/release-keys"
        ["ro.product.system_ext.device"]="blazer"
        ["ro.product.system_ext.model"]="Pixel 10 Pro"
        ["ro.product.system_ext.name"]="blazer"
        ["ro.system_ext.build.fingerprint"]="google/blazer/blazer:16/BP4A.260205.001/14451019:user/release-keys"
		["ro.product.device"]="blazer"
		["ro.product.name"]="blazer"
        ["ro.soc.model"]="Tensor G5"
)

# TODO_VERIFY: Add mustang_value_prop and frankel_value_prop blocks once
# Pixel 10 and Pixel 10 Pro Fold codenames/models are confirmed.

declare -A general_value_props=(
		["persist.wm.extensions.enabled"]="true"
        ["ro.com.google.ime.kb_pad_port_b"]="8"
        ["ro.support_hide_display_cutout"]="true"
        ["ro.opa.eligible_device"]="true"
        ["persist.sys.usb.config"]="mtp,adb"
        ["ro.incremental.enable"]="true"
        ["persist.vendor.enable.thermal.genl"]="true"
        ["vendor.pktrouter"]="1"
        ["ro.product.ab_ota_partitions"]="abl,bl1,bl2,bl31,boot,dtbo,gcf,gsa,gsa_bl1,init_boot,ldfw,modem,pbl,product,pvmfw,system,system_dlkm,system_ext,tzsw,vbmeta,vbmeta_vendor,vendor,vendor_boot,vendor_dlkm,vendor_kernel_boot"
        ["ro.frp.pst"]="/dev/block/by-name/frp"
        ["ro.hardware.keystore"]="trusty"
        ["ro.hardware.gatekeeper"]="trusty"
        ["ro.hardware.keystore_desede"]="true"
        ["debug.stagefright.c2inputsurface"]="-1"
        ["ro.vendor.ddk.set.afbc"]="1"
        ["ro.vendor.gpu.dataspace"]="1"
        # TODO_VERIFY: CPU variant for deepspace/Tensor G5 — cortex-a76 is from zuma/G3
        ["dalvik.vm.isa.arm64.variant"]="cortex-a76"
        ["ro.bionic.cpu_variant"]="cortex-a76"
        ["drm.service.enabled"]="true"
        ["media.mediadrmservice.enable"]="true"
        ["ro.vendor.fingerprint.ta.name"]="g7.app"
        ["persist.vendor.ril.ecc.use.xml"]="1"
        ["persist.vendor.ril.support_nr_ds"]="1"
        ["persist.vendor.ril.use_radio_hal"]="2.1"
        ["ro.vendor.config.build_carrier"]="europen"
        ["vendor.rild.libpath"]="libsitril.so"
        ["vendor.debug.ssrdump.type"]="sscoredump"
        ["ro.soc.model"]="Tensor G5"
		["dumpstate.strict_run"]="false"
        ["persist.vendor.testing_battery_profile"]="2"
        ["masterclear.allow_retain_esim_profiles_after_fdr"]="true"
        ["ro.thermal_warmreset"]="true"
        ["ro.preventative_fsck"]="1"
        ["ro.crypto.volume.options"]=""
        ["ro.arm64.memtag.bootctl_supported"]="1"
        ["persist.arm64.memtag.app.com.android.se"]="off"
        ["persist.arm64.memtag.app.com.android.nfc"]="off"
        ["persist.arm64.memtag.system_server"]="off"
        ["ro.support_one_handed_mode"]="true"
        ["ro.quick_start.oem_id"]="00e0"
		["vendor.display.lbe.supported"]="0"
        ["debug.sf.treat_170m_as_sRGB"]="0"
        ["ro.surface_flinger.supports_background_blur"]="false"
        ["ro.surface_flinger.has_wide_color_display"]="false"
        ["ro.surface_flinger.has_HDR_display"]="false"
        ["vendor.usb.use_ffs_mtp"]="1"
        ["ro.build.selinux"]="0"
        ["ro.boot.selinux"]="permissive"
)


update_keys_in_file() {
    declare -n key_value_pairs="$1"
    for key in "${!key_value_pairs[@]}"; do
		resetprop "$key" "${key_value_pairs[$key]}"
    done
}

fix_bootcontrol_and_SPL_downgrade_wipe(){
    setprop servicemanager.ready true
    resetprop servicemanager.ready true
    resetprop ro.build.version.security_patch ""
}

slot_detect(){
    suffix=`getprop ro.boot.slot_suffix`;
    [[ -z $suffix ]] && suffix=`bootctl get-current-slot | xargs bootctl get-suffix`;
    case $suffix in
        _a) 
            unsuffix=_b
            slot=0
            unslot=1
            
            ;;
        _b) unsuffix=_a 
            slot=1
            unslot=0
            ;;
    esac
}


modules_touch_install(){
    mkdir -vp \
        /dev/modules_inject/vendor_dlkm_a \
        /dev/modules_inject/vendor_dlkm_b

    try_load_modules_from_path() {
        local path="$1"
        local loaded_any=0
        local missing_modules=()
        for module in $modules_touch; do
            files_finded=$(find "$path" 2>/dev/null | grep "${module}.ko$")
            if [ -z "$files_finded" ]; then
                missing_modules+=("$module")
                continue
            fi
            for f in $files_finded; do
                insmod "$f" 2>>$LOGF
                if [ $? -eq 0 ]; then
                    echo "I:modules: $module loaded successfully from $f" >> $LOGF
                    loaded_any=1
                else
                    echo "E:modules: Cannot load $module from $f" >> $LOGF
                    missing_modules+=("$module")
                fi
            done
        done
        echo "${missing_modules[*]}"
        return $loaded_any
    }

    check_modules_loaded() {
        local missing=()
        for module in $modules_touch; do
            if ! lsmod | grep -q "$module"; then
                missing+=("$module")
            fi
        done
        if [ ${#missing[@]} -gt 0 ]; then
            echo "E:modules: Missing modules: ${missing[*]}" >> $LOGF
            return 1
        else
            echo "I:modules: All modules loaded successfully" >> $LOGF
            return 0
        fi
    }

    try_slot() {
        local blk="$1"
        local mnt="$2"
        local slot_name="$3"
        local slot_num="$4"

        if [ ! -b "$blk" ]; then
            echo "W:modules: $blk not found, trying to map..." >> $LOGF
            if ! lptools_new --slot "$slot_num" --suffix "$slot_name" --map vendor_dlkm"$slot_name" ; then
                echo "E:modules: Failed to map $blk" >> $LOGF
                return 1
            fi
        fi

        if mount -r "$blk" "$mnt"; then
            echo "I:modules: Mounted $blk on $mnt" >> $LOGF
            missing=$(try_load_modules_from_path "$mnt")
            umount "$mnt"
            echo "I:modules: Unmounted $mnt" >> $LOGF
            [ -z "$missing" ] && return 0
            echo "W:modules: Missing modules after $slot_name slot attempt: $missing" >> $LOGF
            return 1
        else
            echo "E:modules: Cannot mount $blk" >> $LOGF
            return 1
        fi
    }

    echo "I:modules: Trying current slot $suffix" >> $LOGF
    try_slot "/dev/block/mapper/vendor_dlkm$suffix" "/dev/modules_inject/vendor_dlkm$suffix" "$suffix" "$slot"
    res=$?

    if [ $res -ne 0 ]; then
        echo "I:modules: Trying opposite slot $unsuffix" >> $LOGF
        try_slot "/dev/block/mapper/vendor_dlkm$unsuffix" "/dev/modules_inject/vendor_dlkm$unsuffix" "$unsuffix" "$unslot"
        res=$?
    fi

    check_modules_loaded || {
        echo "I:modules: Trying fallback /system/modules_touch" >> $LOGF
        missing=$(try_load_modules_from_path "/system/modules_touch")
        check_modules_loaded || {
            echo "E:modules: Final failure, modules still missing: $missing" >> $LOGF
            echo "I:modules: Currently loaded modules:" >> $LOGF
            lsmod >> $LOGF
        }
    }
}

fix_kerror7(){
    if ! mountpoint /metadata ; then
        mount /metadata
    fi
    if [ -d /metadata/ota ]; then
        rm -rf /metadata/ota
    fi
    umount /metadata
}

magisk_link_to_OF_FILES(){
    mkdir -p /FFiles/OF_Magisk/ /sdcard/Fox/FoxFiles
    cp -f /system/bin/Magisk-29.zip /FFiles/OF_Magisk/Magisk.zip
    cp -f /system/bin/Magisk-29.zip /FFiles/OF_Magisk/uninstall.zip
    cp -f /system/bin/Magisk-29.zip /sdcard/Fox/FoxFiles/Magisk.zip
    cp -f /system/bin/Magisk-29.zip /sdcard/Fox/FoxFiles/uninstall.zip
}

unzip_magiskboot_binary(){
    mkdir -p /tmp/magisk_unzip
    cd /tmp/magisk_unzip
    unzip /system/bin/Magisk-29.zip
    cp lib/arm64-v8a/libmagiskboot.so /system/bin/magiskboot_29
    chmod 777 /system/bin/magiskboot_29
    cd /tmp
    rm -rf magisk_unzip
}


setenforce 0
LOGF=/tmp/recovery.log;
device_code=`getprop ro.hardware`;



fix_bootcontrol_and_SPL_downgrade_wipe
slot_detect
declare -A touch_modules_devices=(
    # TODO_VERIFY: Touch modules for blazer/deepspace are unknown.
    # These must be determined from the actual vendor_dlkm partition of the device.
    # Placeholder modules below are from similar Pixel devices and will likely NOT work.
    [blazer]="heatmap goog_touch_interface"
)
modules_touch="${touch_modules_devices[$device_code]}"
modules_touch_install
fix_kerror7
update_keys_in_file general_value_props;
update_keys_in_file ${device_code}_value_prop;
magisk_link_to_OF_FILES
unzip_magiskboot_binary
exit 0;

