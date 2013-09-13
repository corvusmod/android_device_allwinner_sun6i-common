LOCAL_PATH := $(call my-dir)

LOCAL_OVERRIDES_PACKAGES := CMUpdater

ifneq ($(filter u10z,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
