# Copyright (C) 2017 Discovery
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


PRODUCT_PACKAGES += \
    DiscoveryOTA \
    libbypass

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ota.romname=Discovery-ROM \
    ro.ota.version=$(shell date +"%Y%m%d")

ifneq ($(filter discovery_z2_plus,$(TARGET_PRODUCT)),)
	PRODUCT_PROPERTY_OVERRIDES += \
		ro.ota.manifest=https://www.discoveryrom.org/secure/api/ota/?device=z2plus
else
	PRODUCT_PROPERTY_OVERRIDES += \
		ro.ota.manifest=https://www.discoveryrom.org/secure/api/ota/?device=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
endif
