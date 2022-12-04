#
# Copyright (C) 2019-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/j2y18lte

# XXX define this first!!
TARGET_DEVICE_SUPPORTS_NFC := false
OVERLAY_DEVICE := j2y18lte
TARGET_DEVICE_LEGACY_KM := true

# XXX I have ss device, but may be edited for other builders.
TARGET_DEVICE_SIM_COUNT := 1

# Inherit from msm8917-common
$(call inherit-product, device/samsung/msm8917-common/msm8917.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Camera
# We have s5k5e3yx_f2_2_chromatix.xml already on common tree
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/msm8917_camera_j2y18.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8917_camera_j2y18.xml \
    $(LOCAL_PATH)/camera/N05QL_s5k5e3yx_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/N05QL_s5k5e3yx_module_info.xml \
    $(LOCAL_PATH)/camera/Y08QF_sr846_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Y08QF_sr846_module_info.xml \
    $(LOCAL_PATH)/camera/Y08QF_sr846_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Y08QF_sr846_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k5e3yx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k5e3yx_chromatix.xml \
    $(LOCAL_PATH)/camera/sr846_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/sr846_chromatix.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sec_touchkey.kl

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += camera.j2y18lte.rc

# Inherit vendor
$(call inherit-product, vendor/samsung/j2y18lte/j2y18lte-vendor.mk)
