# Inherit common stuff
$(call inherit-product, vendor/discovery/config/common.mk)
$(call inherit-product, vendor/discovery/config/common_apn.mk)

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# Telephony 
PRODUCT_PACKAGES += \
    Stk 

# SMS
PRODUCT_PACKAGES += \
	messaging
