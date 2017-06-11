# Versioning System
DU_BASE_VERSION = v11.6

ifndef DU_BUILD_TYPE
    DU_BUILD_TYPE := PERSONAL
endif

# Sign personal builds
ifneq ($(SIGN_BUILD),false)
    ifeq ($(filter-out PERSONAL,$(DU_BUILD_TYPE)),)
        PRODUCT_DEFAULT_DEV_CERTIFICATE := .keys/releasekey
    endif
endif

# Set all versions
DU_VERSION := $(TARGET_PRODUCT)-$(DU_BASE_VERSION)-$(shell date -u +%Y%m%d-%H%M)-$(DU_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.du.version=$(DU_VERSION) \
    ro.mod.version=$(DU_BUILD_TYPE)-$(DU_BASE_VERSION)
