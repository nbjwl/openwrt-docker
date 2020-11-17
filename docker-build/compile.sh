#!/bin/bash

set -e

source src/docker-build/env.sh

[ ! -d "openwrt" ] && git clone --depth 1 $REPO_URL -b $REPO_BRANCH openwrt

cd openwrt 
./scripts/feeds update -a
./scripts/feeds install -a
cd ..

[ -e src/files ] && cp -rf src/files/. openwrt/files
[ -e src/$CONFIG_FILE ] && cp -f src/$CONFIG_FILE openwrt/.config
chmod +x src/$DIY_SH
cd openwrt
../src/$DIY_SH

make defconfig
make download -j$(nproc)
find dl -size -1024c -exec ls -l {} \;
find dl -size -1024c -exec rm -f {} \;

echo -e "$(nproc) thread compile"
make -j$(nproc) || make -j1 V=s

cd bin/targets/*/*
rm -rf packages
