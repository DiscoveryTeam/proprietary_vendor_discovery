#ROM VERSION INFO

ROM_BUILDTYPE := RC4

ROM_VERSION := D2

PRODUCT_DEVICE := $(TARGET_VENDOR_DEVICE_NAME)

DISCOVERY_VERSION := $(ROM_VERSION)

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.discovery.version=$(ROM_VERSION) \
    ro.modversion=$(ROM_BUILDTYPE) \
    ro.discovery.date=$(shell date -u +%Y-%m-%d)


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=0

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

TARGET_BOOTANIMATION_480P := $(shell \
  if [ $(TARGET_SCREEN_WIDTH) -le 720 ]; then \
    echo 'true'; \
  else \
    echo ''; \
  fi )

# Bootanimation
ifeq ($(TARGET_BOOTANIMATION_480P),true)
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/media/bootanimation-480p.zip:system/media/bootanimation.zip
else
# Add Discovery bootanimation based on device resolution
ifneq ($(filter discovery_gemini discovery_z2_plus discovery_kenzo discovery_oneplus2 discovery_oneplus3 discovery_mido,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/media/bootanimation-x800.zip:system/media/bootanimation.zip
endif
ifneq ($(filter discovery_d855 discovery_mako discovery_i9300,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/media/bootanimation-x600.zip:system/media/bootanimation.zip
endif
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/addon.d/50-base.sh:system/addon.d/50-base.sh \
    vendor/discovery/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/discovery/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

# Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/discovery/overlay/dictionaries

# init.d support
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/discovery/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/discovery/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init file
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/etc/init.local.rc:root/init.discovery.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/discovery/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/discovery/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# SuperSU
#ifeq ($(BOARD_VENDOR),sony)
#PRODUCT_COPY_FILES += \
#    vendor/discovery/prebuilt/common/etc/UPDATE-SuperSU-2.52.zip:system/addon.d/UPDATE-SuperSU.zip \
#    vendor/discovery/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
#else
#PRODUCT_COPY_FILES += \
#   vendor/discovery/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
#   vendor/discovery/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
#endif

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Misc packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    MusicFX \
    LatinIME \
    libemoji \
    libsepol \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    powertop \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    ThemeInterfacer \
    Terminal \
    Turbo

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Mms depends on SoundRecorder for recorded audio messages
PRODUCT_PACKAGES += \
    SoundRecorder

# World APN list
ifneq ($(filter discovery_z2_plus,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/etc/apns-full-conf.xml:system/etc/apns-conf.xml
else
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml
endif

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Overlays & Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += \
	vendor/discovery/overlay/common \
	vendor/discovery/overlay/dictionaries

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter arm64,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false


ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_PACKAGES += \
	messaging \
	LiveWallpapers \
	LiveWallpapersPicker

# Include OMS (Substratum)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.substratum.verified=true

# Build Masquerade from sources and Substratum app from prebuilt
PRODUCT_PACKAGES += \
    Substratum

# Magisk Manager
PRODUCT_PACKAGES += \
    MagiskManager

# Copy Magisk zip
PRODUCT_COPY_FILES += \
    vendor/discovery/prebuilt/common/magisk.zip:system/addon.d/magisk.zip

# Jack server heap size
export ANDROID_JACK_VM_ARGS += "-Xmx4096m"
