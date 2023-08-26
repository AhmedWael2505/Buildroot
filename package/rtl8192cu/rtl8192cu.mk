################################################################################
#
# rtl8192cu
#
################################################################################

RTL8192CU_VERSION = 1.0
RTL8192CU_SITE = /home/spectrum/Desktop/BuildRoot/rtl8192cu
RTL8192CU_SITE_METHOD = local

define RTL8192CU_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
endef

RTL8192CU_USER_EXTRA_CFLAGS = 	\
	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN	\
	-DRTW_USE_CFG80211_STA_EVENT \
	-Wno-error

RTL8192CU_MODULE_MAKE_OPTS = \
	CONFIG_PLATFORM_I386_PC=n \
	CONFIG_RTL8192CU=m \
	USER_EXTRA_CFLAGS="$(RTL8192CU_USER_EXTRA_CFLAGS)"

$(eval $(kernel-module))
$(eval $(generic-package))
