mkdir package/community

sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

pushd package/community
git clone https://github.com/kuoruan/luci-app-kcptun.git
git clone --branch master https://github.com/vernesong/OpenClash.git
popd

