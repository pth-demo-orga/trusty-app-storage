# Copyright (C) 2016 The Android Open Source Project
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

LOCAL_DIR := $(GET_LOCAL_DIR)

MODULE := $(LOCAL_DIR)

STORAGE_RPMB_PROTOCOL ?= MMC

MANIFEST := $(LOCAL_DIR)/manifest.json

MODULE_DEFINES := \
	RPMB_PROTOCOL=RPMB_PROTOCOL_$(STORAGE_RPMB_PROTOCOL) \

MODULE_SRCS := \
	$(LOCAL_DIR)/block_allocator.c \
	$(LOCAL_DIR)/block_cache.c \
	$(LOCAL_DIR)/block_device_tipc.c \
	$(LOCAL_DIR)/block_mac.c \
	$(LOCAL_DIR)/block_map.c \
	$(LOCAL_DIR)/block_set.c \
	$(LOCAL_DIR)/block_tree.c \
	$(LOCAL_DIR)/client_tipc.c \
	$(LOCAL_DIR)/crypt.c \
	$(LOCAL_DIR)/file.c \
	$(LOCAL_DIR)/ipc.c \
	$(LOCAL_DIR)/main.c \
	$(LOCAL_DIR)/proxy.c \
	$(LOCAL_DIR)/rpmb.c \
	$(LOCAL_DIR)/super.c \
	$(LOCAL_DIR)/tipc_ns.c \
	$(LOCAL_DIR)/transaction.c \

MODULE_DEPS := \
	trusty/user/base/interface/storage \
	trusty/user/base/lib/hwkey \
	trusty/user/base/lib/libc-trusty \
	external/boringssl \

MODULE_DEPS += \
	trusty/user/app/storage/test \

include make/module.mk

# Build host side unit tests for mock storage implementation.
include trusty/user/app/storage/storage_mock/test_mock_storage_rules.mk
