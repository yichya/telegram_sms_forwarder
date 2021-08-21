include $(TOPDIR)/rules.mk

PKG_NAME:=telegram_sms_forwarder
PKG_VERSION:=0.0.2
PKG_RELEASE:=1

PKG_LICENSE:=MPLv2
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=yichya <mail@yichya.dev>

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=Custom
	CATEGORY:=Extra packages
	TITLE:=Telegram SMS Forwarder
	DEPENDS:=+uqmi +lua +luci-lib-nixio +luci-lib-jsonc +libubus-lua +lua-curl-v3
endef

define Package/$(PKG_NAME)/description
	Forward incoming SMS messages to a Telegram Bot
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/sms_forwarder
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/libexec/rpcd
	$(INSTALL_BIN) ./root/usr/libexec/rpcd/sms_forwarder $(1)/usr/libexec/rpcd/sms_forwarder
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/sms_forwarder $(1)/etc/config/sms_forwarder 
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/sms_forwarder $(1)/etc/init.d/sms_forwarder
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
