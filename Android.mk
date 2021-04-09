#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),v7101o)
  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
$(GATEKEEPER_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf libSoftGatekeeper.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_SYMLINK)

GATEKEEPER_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.mt6771.so
GATEKEEPER_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.v7101o.so
GATEKEEPER_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.mt6771.so
GATEKEEPER_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.v7101o.so
$(GATEKEEPER_TRUSTKERNEL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf gatekeeper.trustkernel.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_TRUSTKERNEL_SYMLINK)

KEYSTORE_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/keystore.mt6771.so
KEYSTORE_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/keystore.v7101o.so
KEYSTORE_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/keystore.mt6771.so
KEYSTORE_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/keystore.v7101o.so
$(KEYSTORE_TRUSTKERNEL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf keystore.v2.trustkernel.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(KEYSTORE_TRUSTKERNEL_SYMLINK)

KMSETKEY_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/kmsetkey.mt6771.so
KMSETKEY_TRUSTKERNEL_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/kmsetkey.mt6771.so
$(KMSETKEY_TRUSTKERNEL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf kmsetkey.trustkernel.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(KMSETKEY_TRUSTKERNEL_SYMLINK)

VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mt6771.so
VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mt6771.so
$(VULKAN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf ../egl/libGLES_mali.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(VULKAN_SYMLINK)

endif
