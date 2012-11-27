#
# Copyright (C) 2009 The Android Open Source Project
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

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/charge/overlay

# Init files
PRODUCT_COPY_FILES := \
    device/samsung/charge/init.smdkc110.rc:root/init.smdkc110.rc \
    device/samsung/charge/init.smdkc110.usb.rc:root/init.smdkc110.usb.rc \
    device/samsung/charge/init.smdkc110.usb.rc:recovery/root/usb.rc \
    device/samsung/charge/ueventd.smdkc110.rc:root/ueventd.smdkc110.rc \
    device/samsung/charge/lpm.rc:root/lpm.rc

# kernel modules for ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/charge/modules,root/lib/modules)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/charge/modules,recovery/root/lib/modules)

# egl
PRODUCT_COPY_FILES += \
    device/samsung/charge/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# audio_policy.conf
PRODUCT_COPY_FILES += \
    device/samsung/charge/libaudio/audio_policy.conf:system/etc/audio_policy.conf

# touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/charge/prebuilt/usr/idc/qt602240_ts_input.idc:system/usr/idc/qt602240_ts_input.idc

# vold
PRODUCT_COPY_FILES += \
    device/samsung/charge/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Keylayout / Keychars
PRODUCT_COPY_FILES += \
    device/samsung/charge/prebuilt/usr/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    device/samsung/charge/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/charge/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/charge/prebuilt/usr/keylayout/Broadcom_Bluetooth_HID.kl:system/usr/keylayout/Broadcom_Bluetooth_HID.kl \
    device/samsung/charge/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# Generated kcm keymaps
PRODUCT_PACKAGES := \
    s3c-keypad.kcm

# update utilities
PRODUCT_PACKAGES += \
    make_ext4fs \
    bootmenu_busybox \
    bmlwrite

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
    hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
    device/samsung/charge/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/charge/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
    libSEC_OMX_Core \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.M4V.Encoder \
    libOMX.SEC.AVC.Encoder

# audio libs
PRODUCT_PACKAGES += \
    audio.primary.s5pc110 \
    audio_policy.s5pc110 \
    audio.a2dp.default \
    audio.usb.default

# media/gfx libs
PRODUCT_PACKAGES += \
    hwcomposer.s5pc110 \
    libs3cjpeg \
    libstagefrighthw \
    camera.s5pc110

# lights
PRODUCT_PACKAGES += \
    lights.s5pc110

# Device-specific packages
PRODUCT_PACKAGES += \
    Smdkc110Parts \
    tvouthack	
	
# Charger
PRODUCT_PACKAGES += \
  charger \
  charger_res_images

# RIL
PRODUCT_PACKAGES += \
    Stk \

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# radio stuff
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.numeric=311480 \
    ro.cdma.home.operator.alpha=VzW \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
    ro.cdma.otaspnumschema=SELC,3,00,07,80,87,88,99 \
    net.cdma.pppd.authtype=require-chap \
    net.cdma.pppd.user=user[SPACE]VerizonWireless \
    net.cdma.datalinkinterface=/dev/ttyCDMA0 \
    net.connectivity.type=CDMA1 \
    net.interfaces.defaultroute=cdma \
    ro.telephony.ril_class=SamsungChargeRIL \
    mobiledata.interfaces=eth0,ppp0,hrdp0,pdp0,pdpbr0,svnet0,hrdp1,pdp1,pdpbr1,hrdp1,pdp2,pdpbr2,hrdp3,pdp3,pdpbr3 \
    net.cdma.ppp.interface=ppp0

#    ro.telephony.ril.v3=datacall \
     #persist.radio.reset_on_switch=true \
# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=90 \
    ro.wifi.channels=11

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

# disable usb debugging notif
PRODUCT_PROPERTY_OVERRIDES += \
    persist.adb.notify=0
	
# Enable HighEnd Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.override.highendgfx=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# copy the filesystem converter
PRODUCT_COPY_FILES += \
    device/samsung/charge/updater.sh:updater.sh

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/charge/charge-vendor.mk)
