#!/bin/bash

source env.sh

if [[ ${CLEAN_BUILD} == 'Y' ]]
then
  docker rm -f openwrt-build-env
  docker run -itd \
    --name openwrt-build-env \
    -h P3TERX \
    -p 10022:22 \
    --env http_proxy=${PROXY} \
    --env https_proxy=${PROXY} \
    p3terx/openwrt-build-env:latest
fi

docker start openwrt-build-env

set -e

docker exec openwrt-build-env \
mkdir -p src

rm -rf dist

docker exec openwrt-build-env \
rm -rf /home/user/src
docker cp ../. openwrt-build-env:/home/user/src/

docker exec openwrt-build-env \
src/docker-build/compile.sh

mkdir -p dist
docker cp openwrt-build-env:/home/user/openwrt/bin/targets/. dist

cd dist/*/*
find . -name '*.tar.gz' -exec docker import {} ${DOCKER_USER}/openwrt:19.07 \;