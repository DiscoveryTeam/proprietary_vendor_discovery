#
# This policy configuration will be used by all qcom products
# that inherit from Cardinal
#

BOARD_SEPOLICY_DIRS += \
    vendor/discovery/sepolicy/qcom/common \
    vendor/discovery/sepolicy/qcom/$(TARGET_BOARD_PLATFORM)
