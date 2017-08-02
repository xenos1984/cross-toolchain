#!/bin/bash
set -e

target=$1
prefix=/usr/cross/$target

gcc=`ls -1 /usr/src | grep -o 'gcc-[0-9]\+.[0-9]\+.[0-9]\+'`
binutils=`ls -1 /usr/src | grep -o 'binutils-[0-9]\+.[0-9]\+.[0-9]\+'`
newlib=`ls -1 /usr/src | grep -o 'newlib-[0-9]\+.[0-9]\+.[0-9]\+'`

mkdir -p /tmp/toolchain
mkdir -p /tmp/toolchain/build-binutils
mkdir -p /tmp/toolchain/build-gcc
mkdir -p /tmp/toolchain/build-newlib

cd /tmp/toolchain/build-binutils
/usr/src/$binutils/configure --target=$target --prefix=$prefix --disable-nls 2>&1
make all 2>&1
make install 2>&1

cd /tmp/toolchain/build-gcc
/usr/src/$gcc/configure --target=$target --prefix=$prefix --disable-nls --enable-languages=c,c++ --enable-libstdcxx --without-headers 2>&1
make all-gcc 2>&1
make install-gcc 2>&1
make all-target-libgcc 2>&1
make install-target-libgcc 2>&1

ln -s -f $prefix/bin/* /usr/local/bin/

cd /tmp/toolchain/build-newlib
/usr/src/$newlib/configure --target=$target --prefix=$prefix 2>&1
make all 2>&1
make install 2>&1

cd /tmp/toolchain/build-gcc
/usr/src/$gcc/configure --target=$target --prefix=$prefix --disable-nls --enable-languages=c,c++ --enable-libstdcxx --without-headers --with-newlib 2>&1
make all-target-libstdc++-v3 2>&1
make install-target-libstdc++-v3 2>&1

ln -s -f $prefix/bin/* /usr/local/bin/

cd /tmp
rm -rf /tmp/toolchain

