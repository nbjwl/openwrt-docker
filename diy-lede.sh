mkdir package/community

pushd package/community
git clone -b luci2 https://github.com/kuoruan/luci-app-v2ray.git
git clone https://github.com/kuoruan/luci-app-kcptun.git
git clone --branch master https://github.com/vernesong/OpenClash.git
popd
