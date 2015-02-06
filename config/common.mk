ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=1 

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
ifneq ($(WITH_GMS),true)
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/bin/50-eos.sh:system/addon.d/50-eos.sh \
    vendor/eos/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/eos/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions
endif

# init.d support
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/eos/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# init file
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/etc/init.eos.rc:root/init.eos.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Extra packages
PRODUCT_PACKAGES += \
    AudioFX \
    BluetoothExt \
    CustomWallpapers \
    Eleven \
    Launcher3 \
    LockClock \
    OTACenter 

# Extra tools
PRODUCT_PACKAGES += \
    libsepol \
    bash \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    ntfsfix \
    ntfs-3g

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# Busybox
PRODUCT_PACKAGES += \
    Busybox

# Screen recorder package and lib
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# T-Mobile theme engine
include vendor/eos/config/themes_common.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/eos/overlay/common

# Inherit common product build prop overrides
-include vendor/eos/config/common_versions.mk

$(call inherit-product-if-exists, vendor/extra/product.mk)
