mkdir package/community

pushd package/community
git clone -b luci2 https://github.com/kuoruan/luci-app-v2ray.git
git clone https://github.com/kuoruan/luci-app-kcptun.git
git clone --branch master https://github.com/vernesong/OpenClash.git
git clone https://github.com/jerrykuku/luci-theme-argon.git
popd

rm -rf feeds/packages/libs/libcap
svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap

wget https://github.com/xtaci/kcptun/releases/download/v20201010/kcptun-linux-arm64-20201010.tar.gz -O /tmp/kcptun.tar.gz
wget https://github.com/v2fly/v2ray-core/releases/download/v4.32.1/v2ray-linux-arm64-v8a.zip -O /tmp/v2ray.zip

tar -xzvf /tmp/kcptun.tar.gz -C files/usr/bin
mv files/usr/bin/server_linux_arm64 files/usr/bin/kcptun_server
mv files/usr/bin/client_linux_arm64 files/usr/bin/kcptun_client
unzip -o /tmp/v2ray.zip -d files/usr/bin 
