mkdir package/community

pushd package/community
git clone https://github.com/kuoruan/openwrt-kcptun.git
git clone https://github.com/kuoruan/luci-app-kcptun.git
git clone -b luci2 https://github.com/kuoruan/luci-app-v2ray.git
git clone https://github.com/kuoruan/openwrt-v2ray.git
git clone --branch master https://github.com/vernesong/OpenClash.git
git clone https://github.com/jerrykuku/luci-theme-argon.git
popd