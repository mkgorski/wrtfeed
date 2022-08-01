include $(TOPDIR)/rules.mk

PKG_NAME:=myfeed-rockchip
PKG_VERSION:=1
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Marcin Górski <mkgorski@gmail.com>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/myfeed-orangepi-r1plus
  CATEGORY:=Custom Feed
  SUBMENU:=Profiles
  TITLE:=Custom dependencies for OrangePi R1 Plus board
  DEPENDS:=+myfeed-base +myfeed-usb +myfeed-usb-serial-drivers +myfeed-huawei-LTE \
           +tcpdump +git +nginx +runit +mwan3 \
           +mosquitto-nossl +libmosquitto-nossl +mosquitto-client-nossl \
           +wireguard-tools +kmod-wireguard
endef

define Build/Compile
	true
endef

define Package/myfeed-orangepi-r1plus/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/98-setup-opi $(1)/etc/uci-defaults
	$(LN) /root/log $(1)/etc
endef

$(eval $(call BuildPackage,myfeed-orangepi-r1plus))