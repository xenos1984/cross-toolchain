#!/bin/bash
set -e

version=`wget -O - http://download.qemu.org/ | grep -o 'qemu-[0-9]\+.[0-9]\+.[0-9]\+' | sed 's/qemu-//' | sort -V | tail -n 1`

cd /tmp
wget -c -O qemu-$version.tar.xz http://download.qemu.org/qemu-$version.tar.xz
tar -xf qemu-$version.tar.xz
cd qemu-$version
./configure
make
make install
cd /tmp
rm -rf qemu-$version.tar.xz qemu-$version

