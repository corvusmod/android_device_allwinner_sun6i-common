#
# Copyright (C) 2011 The Android Open-Source Project
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
#

COMMON_PATH := device/sun6i-common

DEVICE_PACKAGE_OVERLAYS := $(COMMON_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_COPY_FILES += \
    device/allwinner/sun6i-common/init.sun6i.usb.rc:root/init.sun6i.usb.rc \
    device/allwinner/sun6i-common/ueventd.sun6i.rc:root/ueventd.sun6i.rc

# Firmware
PRODUCT_COPY_FILES += \
    device/allwinner/sun6i-common/prebuilt/firmware/ct36x-sc5012-v10.bin:system/vendor/firmware/ct36x-sc5012-v10.bin \
    device/allwinner/sun6i-common/prebuilt/firmware/gsl3680-sc5075-hs-jg-gg.bin:system/vendor/firmware/gsl3680-sc5075-hs-jg-gg.bin \
    device/allwinner/sun6i-common/prebuilt/firmware/gslX680-sc5009-v99.bin:system/vendor/firmware/gslX680-sc5009-v99.bin

# Hardware-specific features
PRODUCT_COPY_FILES += \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    device/allwinner/sun6i-common/configs/permissions/android.hardware.live_wallpaper.xml:system/etc/permissions/android.hardware.live_wallpaper.xml \
    device/allwinner/sun6i-common/configs/permissions/android.software.pppoe.xml:system/etc/permissions/android.software.pppoe.xml \
    device/allwinner/sun6i-common/configs/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    device/allwinner/sun6i-common/configs/permissions/platform.xml:system/etc/permissions/android.hardware.platform.xml \
    device/allwinner/sun6i-common/configs/permissions/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# WiFi
PRODUCT_COPY_FILES += \
    device/allwinner/sun6i-common/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Vold/Storage
PRODUCT_COPY_FILES += \
    device/allwinner/sun6i-common/configs/vold.fstab:system/etc/vold.fstab

# Recovery
PRODUCT_COPY_FILES += \
    device/allwinner/sun6i-common/recovery/keyboard.ko:recovery/root/keyboard.ko \
    device/allwinner/sun6i-common/recovery/nand.ko:recovery/root/nand.ko \
    device/allwinner/sun6i-common/recovery/touch.ko:recovery/root/touch.ko

# Audio/Alsa
#PRODUCT_COPY_FILES += \

# Build extra packages

# Audio
#PRODUCT_PACKAGES += \
#    audio.a2dp.default \
#    audio.usb.default \
#    tinyplay

# Bluetooth
PRODUCT_PACKAGES += \
    hciconfig \
    hcitool \
    bttest \
    l2ping

# Filesystem management
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Graphics
PRODUCT_PACKAGES += \
    librs_jni

# Extra packages
PRODUCT_PACKAGES += \
    busybox \
    Camera \
    dbus-send

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.opengles.version=131072 \
    hwui.render_dirty_regions=false \
    wifi.supplicant_scan_interval=15

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.timezone=Europe/Stockholm \
    ro.allow.mock.location=1 \
    ro.kernel.android.checkjni=1 \
    sys.hwc.compose_policy=6 \
    testing.mediascanner.skiplist=/mnt/sdcard/Android/

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_TAGS += dalvik.gc.type-precise

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

# Include google apps
$(call inherit-product-if-exists, vendor/google/gapps.mk)

# Setup proprietary files
$(call inherit-product-if-exists, vendor/allwinner/sun6i-common/common-vendor.mk)
