#
# Copyright (C) 2022 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# API
PRODUCT_SHIPPING_API_LEVEL := 27

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# QCOM Decryption
PRODUCT_PACKAGES += \
	qcom_decrypt \
	qcom_decrypt_fbe

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
	libion \
	libxml2

RECOVERY_LIBRARY_SOURCE_FILES += \
	$(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so

# FDE [Not Supported]
TARGET_HW_DISK_ENCRYPTION := true
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
$(warning FDE doesn't work with the 11.0 manifest. You will not be able to decrypt MIUI ROMs)

TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

TARGET_RECOVERY_DEVICE_MODULES += \
	android.system.suspend@1.0 \
	libhardware_legacy

RECOVERY_LIBRARY_SOURCE_FILES += \
	$(TARGET_OUT_SHARED_LIBRARIES)/android.system.suspend@1.0.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libhardware_legacy.so

PRODUCT_COPY_FILES += \
	$(OUT_DIR)/target/product/beryllium/obj/SHARED_LIBRARIES/libcryptfs_hw_intermediates/libcryptfs_hw.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libcryptfs_hw.so
endif
