#!/bin/sh /etc/rc.common
# (C) 2013 openwrt.org

START=70

start() {
  env - runsvdir /service &
}
