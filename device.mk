# Copyright 2014 The Android Open Source Project
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

# Device path
DEVICE_PATH := device/sony/suzu

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/rootdir/system/etc/BCM43455.hcd:system/etc/firmware/BCM43xx.hcd \
    $(DEVICE_PATH)/rootdir/system/etc/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    $(DEVICE_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/vendor/etc/audio_output_policy.conf:system/vendor/etc/audio_output_policy.conf \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_qrd_skui.xml:system/etc/mixer_paths_qrd_skui.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_qrd_skuhf.xml:system/etc/mixer_paths_qrd_skuhf.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_wcd9306.xml:system/etc/mixer_paths_wcd9306.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_skuk.xml:system/etc/mixer_paths_skuk.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_qrd_skum.xml:system/etc/mixer_paths_qrd_skum.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_qrd_skun_cajon.xml:system/etc/mixer_paths_qrd_skun_cajon.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_msm8952_polaris.xml:system/etc/mixer_paths_msm8952_polaris.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sound_trigger_mixer_paths_wcd9306.xml:system/etc/sound_trigger_mixer_paths_wcd9306.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sound_trigger_mixer_paths_wcd9330.xml:system/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_wcd9330.xml:system/etc/mixer_paths_wcd9330.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_wcd9335.xml:system/etc/mixer_paths_wcd9335.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_wcd9326.xml:system/etc/mixer_paths_wcd9326.xml \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths_qrd_skun.xml:system/etc/mixer_paths_qrd_skun.xml \
    $(DEVICE_PATH)/rootdir/system/etc/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/rootdir/system/etc/audio_platform_info_extcodec.xml:system/etc/audio_platform_info_extcodec.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sound_trigger_mixer_paths_wcd9335.xml:system/etc/sound_trigger_mixer_paths_wcd9335.xml \
    $(DEVICE_PATH)/rootdir/system/etc/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    $(DEVICE_PATH)/rootdir/system/etc/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt

# Camera Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/etc/camera/camera_config.xml:system/etc/camera/camera_config.xml \
    $(DEVICE_PATH)/rootdir/system/etc/camera/imx214_chromatix.xml:system/etc/camera/imx214_chromatix.xml \
    $(DEVICE_PATH)/rootdir/system/etc/camera/imx300_chromatix.xml:system/etc/camera/imx300_chromatix.xml

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.suzu \
    init.suzu \
    ueventd.suzu

# Lights
PRODUCT_PACKAGES += \
    lights.suzu

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.suzu

# Fingerprint HAL
PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.suzu

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.suzu

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=480 \
    ro.usb.pid_suffix=1E0

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/loire-common/platform_omni.mk)
$(call inherit-product, vendor/sony/loire-suzu/suzu-vendor.mk)

# copy wlan firmware
$(call inherit-product-if-exists, vendor/sony/aosp_broadcom/wlan/bcmdhd/firmware/bcm4345/device-bcm.mk)
