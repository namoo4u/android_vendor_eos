# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=LRX22G BUILD_ID=LRX22G BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

# Versioning System
PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 0
# PRODUCT_VERSION_MAINTENANCE = Beta-0.4

ROM_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(CUSTOM_BUILD)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.eos.version=$(ROM_VERSION) \
  eos.ota.version=$(shell date -u +%Y%m%d) \
  ro.modversion=$(ROM_VERSION)
