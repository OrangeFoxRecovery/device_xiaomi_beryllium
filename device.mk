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

# QCOM Decryption
PRODUCT_PACKAGES += \
	qcom_decrypt \
	qcom_decrypt_fbe

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
	libion \
	libxml2 \
	libandroidicu \
	libicuuc \
	libicui18n \
	libqcbor \
	libhardware_legacy \
	android.system.suspend@1.0

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
	$(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libicuuc.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libicui18n.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libqcbor.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libhardware_legacy.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/android.system.suspend@1.0.so

PRODUCT_COPY_FILES += \
	$(OUT_DIR)/target/product/beryllium/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so
