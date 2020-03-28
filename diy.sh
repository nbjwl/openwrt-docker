#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.0.9/g' package/base-files/files/bin/config_generate

rm -rf package/community
mkdir package/community

pushd package/community
git clone https://github.com/kuoruan/luci-app-kcptun.git
git clone https://github.com/kuoruan/luci-app-v2ray
popd