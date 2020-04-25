#!/bin/bash

set -e

source env.sh

if [[ ${CLEAN_BUILD} == 'Y' ]]
then
  docker rm -f openwrt-build-env
  docker run -itd \
    --name openwrt-build-env \
    -h P3TERX \
    -p 10022:22 \
    p3terx/openwrt-build-env:latest
fi

docker start openwrt-build-env

docker exec openwrt-build-env \
sudo apt-get update

docker exec openwrt-build-env \
sudo apt-get install -y rsync

docker exec openwrt-build-env \
mkdir -p src

ssh-keygen -f ~/.ssh/known_hosts -R localhost:10022

sshpass -p "user" rsync -av -e "ssh -o StrictHostKeyChecking=no -p 10022" \
--exclude=".github" --exclude=".git" --exclude="docker-build/dist" \
../ user@localhost:src/

docker exec openwrt-build-env \
src/docker-build/compile.sh

rm -rf dist
mkdir -p dist

sshpass -p "user" scp -r -o StrictHostKeyChecking=no -P 10022 \
user@localhost:/home/user/openwrt/bin/targets/* \
dist/

cd dist/*/*
find . -name '*.tar.gz' -exec docker import {} ${DOCKER_USER}/openwrt:beta \;