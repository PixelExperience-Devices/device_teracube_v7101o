LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE      := libshim_vtservice
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES   := vtservice/libshim_vtservice.cpp
include $(BUILD_SHARED_LIBRARY)
