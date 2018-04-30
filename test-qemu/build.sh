#!/bin/bash
set -e

qemu=`ls -1 /usr/src | grep -o 'qemu-[0-9]\+.[0-9]\+.[0-9]\+'`

mkdir -p /tmp/build-qemu
cd /tmp/build-qemu
/usr/src/$qemu/configure
make
make install
cd /tmp
rm -rf /tmp/build-qemu /usr/src/$qemu

