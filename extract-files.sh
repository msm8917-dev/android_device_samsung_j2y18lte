#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libmmcamera2_sensor_modules.so)
            sed -i 's/system\/etc/vendor\/etc/g' "${2}"
	    sed -i 's/data\/misc/data\/oem\//g' "${2}"
	    "${PATCHELF}" --add-needed "libshim_qcamerad.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=j2y18lte
export DEVICE_COMMON=msm8917-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
