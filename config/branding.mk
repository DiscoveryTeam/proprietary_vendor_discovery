#ROM VERSION INFO
ROM_BUILDTYPE := RC1
ROM_VERSION := D1
PRODUCT_DEVICE := $(TARGET_VENDOR_DEVICE_NAME)
DISCOVERY_VERSION := $(ROM_BUILDTYPE)-$(ROM_VERSION)

CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
CUSTOM_VERSION := discovery_$(PRODUCT_DEVICE)_$(ROM_BUILDTYPE)-$(ROM_VERSION)_$(PLATFORM_VERSION)_$(shell date +%Y-%m-%d)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.discovery.buildtype=$(ROM_BUILDTYPE) \
    ro.discovery.version=$(ROM_VERSION) \
    ro.discovery.date=$(shell date -u +%Y-%m-%d) \
    ro.mod.version=$(CUSTOM_VERSION) \
    ro.mod.build_date=$(CUSTOM_BUILD_DATE)
