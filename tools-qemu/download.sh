#!/bin/bash
set -e

version=`wget -O - http://download.qemu.org/ | grep -o 'qemu-[0-9]\+.[0-9]\+.[0-9]\+' | sed 's/qemu-//' | sort -V | tail -n 1`

mkdir -p /usr/src
cd /usr/src

wget -c -O /tmp/qemu-$version.tar.xz http://download.qemu.org/qemu-$version.tar.xz
tar -xf /tmp/qemu-$version.tar.xz
rm /tmp/qemu-$version.tar.xz

