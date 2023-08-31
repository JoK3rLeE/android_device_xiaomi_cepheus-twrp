#
# Copyright 2018 The Android Open Source Project
#
# Copyright (C) 2021-2022 The OrangeFox Recovery Project
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

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 30
# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 31

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

# Assert
TARGET_OTA_ASSERT_DEVICE := cepheus

TARGET_COPY_OUT_VENDOR := vendor

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# BootHal
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

# Bootctrl
PRODUCT_PACKAGES += \
    bootctrl.msmnile.recovery

# PRODUCT_RELEASE_NAME ro.twrp.device.name
PRODUCT_PROPERTY_OVERRIDES += ro.twrp.device.name=$(PRODUCT_RELEASE_NAME)

# Crypto
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Recovery
TARGET_RECOVERY_DEVICE_MODULES += \
	libion \
	libxml2 \
	vendor.display.config@1.0 \
	vendor.display.config@2.0 \
	libdisplayconfig.qti

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
