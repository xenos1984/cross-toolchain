#!/bin/bash
set -e

qemu=`ls -1 /usr/src | grep -o 'qemu-[0-9]\+.[0-9]\+.[0-9]\+'`

mkdir -p /tmp/build-qemu
cd /tmp/build-qemu
/usr/src/$qemu/configure --disable-user
make -j $(nproc --all)
make install
cd /tmp
rm -rf /tmp/build-qemu /usr/src/$qemu
