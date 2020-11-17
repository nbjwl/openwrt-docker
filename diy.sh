mkdir package/community

pushd package/community
git clone -b luci2 https://github.com/kuoruan/luci-app-v2ray.git
git clone --branch master https://github.com/vernesong/OpenClash.git
git clone https://github.com/jerrykuku/luci-theme-argon.git
popd

wget https://github.com/xtaci/kcptun/releases/download/v20201010/kcptun-linux-arm64-20201010.tar.gz -O /tmp/kcptun.tar.gz
wget https://github.com/v2fly/v2ray-core/releases/download/v4.32.1/v2ray-linux-arm64-v8a.zip -O /tmp/v2ray.zip

tar -xzvf /tmp/kcptun.tar.gz -C /usr/bin
unzip v2ray.zip -d /usr/bin