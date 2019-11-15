#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# Inherit from v7101o device
$(call inherit-product, device/teracube/v7101o/device.mk)

# Inherit some common PixelExperience stuff.
TARGET_GAPPS_ARCH := arm64
TARGET_BOOT_ANIMATION_RES := 1080
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosp_v7101o
PRODUCT_DEVICE := v7101o
PRODUCT_BRAND := Teracube
PRODUCT_MODEL := Teracube One
PRODUCT_MANUFACTURER := Teracube

# Fingerprint
BUILD_FINGERPRINT := Teracube/Teracube_One/Teracube_One:9/PPR1.180610.011/20200610:user/release-keys
BUILD_DESCRIPTION := full_v7101o-user 9 PPR1.180610.011 20200610 release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(BUILD_DESCRIPTION)"
    
PRODUCT_GMS_CLIENTID_BASE := android-vanzo
