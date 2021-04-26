#
# Copyright (C) 2021 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from v7101o device
$(call inherit-product, device/teracube/v7101o/device.mk)

# Inherit some common PixelExperience stuff.
TARGET_USES_AOSP_RECOVERY := true
TARGET_BOOT_ANIMATION_RES := 1080
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosp_v7101o
PRODUCT_DEVICE := v7101o
PRODUCT_BRAND := Teracube
PRODUCT_MODEL := Teracube One
PRODUCT_MANUFACTURER := Teracube
    
PRODUCT_GMS_CLIENTID_BASE := android-teracube

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=v7101o
