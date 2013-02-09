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

TARGET_BOOTLOADER_BOARD_NAME := a31
TARGET_BOARD_PLATFORM := sun6i

USE_CAMERA_STUB := false
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# CPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
#TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# CFLAGS
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_RC := false
TARGET_PROVIDES_INIT_TARGET_RC := true

# Kernel
# TARGET_KERNEL_SOURCE := kernel/sunxi
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := console=ttyS0,115200 rw init=/init loglevel=4 ion_reserve=256M

# Custom kernel toolchain
# TARGET_KERNEL_CUSTOM_TOOLCHAIN :=

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_SYSTEMIMAGES_USE_EXT3 := true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISABLE_TRIPLE_BUFFERING := true
BOARD_EGL_CFG := device/allwinner/sun6i-common/configs/egl.cfg
ENABLE_WEBGL := true
BOARD_USE_SKIA_LCDTEXT := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# HWComposer
BOARD_USES_HWCOMPOSER := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_WITH_ALSA_UTILS := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false

# Wifi
BOARD_WIFI_VENDOR                := realtek
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
BOARD_HOSTAPD_DRIVER             := WEXT
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_rtl
BOARD_WLAN_DEVICE                := rtl8192cu

WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/8192cu.ko"
WIFI_DRIVER_MODULE_NAME          := 8192cu

#TARGET_CUSTOM_WIFI := ../../hardware/realtek/wlan/wifi_realtek.c

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
TARGET_CUSTOM_BLUEDROID := ../../../device/allwinner/sun6i-common/bluetooth/bluedroid.c

# Recovery
TARGET_NO_RECOVERY := false
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := false
TARGET_RECOVERY_INITRC := device/allwinner/sun6i-common/recovery/init.recovery.rc
TARGET_RECOVERY_PRE_COMMAND := "setrecovery"
# Recovery - twrp specific
DEVICE_RESOLUTION := 1920x1200
TW_NO_REBOOT_BOOTLOADER := true
#TW_NO_REBOOT_RECOVERY := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
SP1_NAME := "bootloader"
SP1_DISPLAY_NAME := "Bootloader"
SP1_BACKUP_METHOD := image
SP1_MOUNTABLE := 0
SP2_NAME := "env"
SP2_DISPLAY_NAME := "U-Boot env. variables"
SP2_BACKUP_METHOD := image
SP2_MOUNTABLE := 0
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/allwinner/sun6i-common/recovery/recovery_keys.c


# inherit from the proprietary version
-include vendor/allwinner/sun6i-common/BoardConfigVendor.mk
