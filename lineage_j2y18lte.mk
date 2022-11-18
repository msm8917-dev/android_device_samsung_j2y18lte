#
# Copyright (C) 2019 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from j4primelte device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

PRODUCT_BRAND := samsung
PRODUCT_DEVICE := j2y18lte
PRODUCT_MANUFACTURER := samsung
PRODUCT_NAME := lineage_j2y18lte
PRODUCT_MODEL := Galaxy J2 Pro

PRODUCT_GMS_CLIENTID_BASE := android-samsung
TARGET_VENDOR := samsung
TARGET_VENDOR_PRODUCT_NAME := j2y18lte
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="j2y18lteks-user 7.1.1 NMF26X.J250NKOU1ARD1 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "samsung/j2y18lteks/j2y18lte:7.1.1/NMF26X.J250NKOU1ARD1:user/release-keys"
