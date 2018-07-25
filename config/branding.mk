#ROM VERSION INFO
ROM_BUILDTYPE := RC5
ROM_VERSION := D1
PRODUCT_DEVICE := $(TARGET_VENDOR_DEVICE_NAME)
DISCOVERY_VERSION := $(ROM_BUILDTYPE)-$(ROM_VERSION)

ifndef DEVICE_MAINTAINER
DEVICE_MAINTAINER := Unofficial
endif

CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
CUSTOM_VERSION := discovery_rom_$(ROM_BUILDTYPE)_$(ROM_VERSION)_$(PRODUCT_DEVICE)_$(PLATFORM_VERSION)_$(shell date +%Y-%m-%d)

PRODUCT_GENERIC_PROPERTIES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.product.maintainer=$(DEVICE_MAINTAINER) \
    ro.discovery.buildtype=$(ROM_BUILDTYPE) \
    ro.discovery.version=$(ROM_VERSION) \
    ro.discovery.date=$(shell date -u +%Y-%m-%d) \
    ro.mod.version=$(CUSTOM_VERSION) \
    ro.mod.build_date=$(CUSTOM_BUILD_DATE) \
    ro.discovery.display.version=$(DISCOVERY_VERSION)
