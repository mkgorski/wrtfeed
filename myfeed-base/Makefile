include $(TOPDIR)/rules.mk

PKG_NAME:=myfeed-base
PKG_VERSION:=1
PKG_RELEASE=$(PKG_SOURCE_VERSION)
PKG_MAINTAINER:=Marcin Górski <mkgorski@gmail.com>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/myfeed-base
  CATEGORY:=Custom Feed
  SUBMENU:=
  TITLE:=MyFeed base packages
  DEPENDS:=+rsync +strace +curl +coreutils +coreutils-timeout \
           +libubox +htop +usbutils +jq +coreutils-stty \
  				 +@KERNEL_CGROUPS +@KERNEL_NAMESPACES \
           +openssh-client +dropbearconvert \
           +myfeed-ssh-keys +myfeed-runsvdir
endef

define Package/myfeed-ssh-keys
  CATEGORY:=Custom Feed
  SUBMENU:=
  TITLE:=MyFeed default SSH authorized_keys
  DEPENDS:=
endef

define Package/myfeed-runsvdir
  CATEGORY:=Custom Feed
  SUBMENU:=
  TITLE:=MyFeed runsvdir init script
  DEPENDS:=
endef

define Package/myfeed-usb
  CATEGORY:=Custom Feed
  SUBMENU:=
  TITLE:=MyFeed USB
  DEPENDS:=+kmod-usb2 +hub-ctrl +kmod-usb-hid
endef

define Package/myfeed-usb-serial-drivers
  CATEGORY:=Custom Feed
  SUBMENU:=
  TITLE:=MyFeed USB to serial converters FTDI and CP210x
  DEPENDS:=+kmod-usb-serial-cp210x +kmod-usb-serial-ftdi
endef

define Package/myfeed-huawei-LTE
  CATEGORY:=Custom Feed
  SUBMENU:=
  TITLE:=MyFeed LTE Huawei E3372 modems
  DEPENDS:=+kmod-usb-net +kmod-usb-net-cdc-ether
endef

define Package/myfeed-usb-eth
  CATEGORY:=Custom Feed
  SUBMENU:=
  TITLE:=kmods for USB ethernet adapters - most popular ones
  DEPENDS:=+kmod-usb-net +kmod-usb-net-kaweth +kmod-usb-net-rtl8150 +kmod-usb-net-rtl8152 +kmod-usb-net-asix +kmod-usb-net-asix-ax88179
endef

define Build/Compile
	true
endef

define Package/myfeed-base/install
	$(INSTALL_DIR) $(1)/etc/
endef

define Package/myfeed-ssh-keys/install
	$(INSTALL_DIR) $(1)/etc/dropbear
	$(INSTALL_DATA) ./files/dropbear-authorized_keys $(1)/etc/dropbear/authorized_keys
	chmod 0600 $(1)/etc/dropbear/authorized_keys
endef

define Package/myfeed-runsvdir/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/service
	$(INSTALL_BIN) ./files/runsvdir-init.d $(1)/etc/init.d
endef

define Package/myfeed-usb/install
	$(INSTALL_DIR) $(1)/etc/
endef

define Package/myfeed-usb-eth/install
	$(INSTALL_DIR) $(1)/etc/
endef

define Package/myfeed-3g/install
	$(INSTALL_DIR) $(1)/etc/
endef

define Package/myfeed-usb-serial-drivers/install
	$(INSTALL_DIR) $(1)/etc/
endef

define Package/myfeed-huawei-LTE/install
	$(INSTALL_DIR) $(1)/etc/
endef

define Package/myfeed-runsvdir/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Enabling rc.d symlink for runsvdir"
        /etc/init.d/runsvdir enable
fi
exit 0
endef

define Package/myfeed-runsvdir/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Removing rc.d symlink for runsvdir"
        /etc/init.d/runsvdir disable
fi
exit 0
endef

$(eval $(call BuildPackage,myfeed-base))
$(eval $(call BuildPackage,myfeed-ssh-keys))
$(eval $(call BuildPackage,myfeed-runsvdir))
$(eval $(call BuildPackage,myfeed-usb))
$(eval $(call BuildPackage,myfeed-usb-serial-drivers))
$(eval $(call BuildPackage,myfeed-usb-eth))
$(eval $(call BuildPackage,myfeed-huawei-LTE))
