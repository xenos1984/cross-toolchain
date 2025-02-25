#!/bin/bash
set -e

target=$1
prefix=/usr/cross/$target

case $target in
i686-elf)
	targets=$target,i686-pe
	;;
x86_64-elf)
	targets=$target,x86_64-pe
	;;
*)
	targets=$target
	;;
esac

gcc=`ls -1 /usr/src | grep -o 'gcc-[0-9]\+.[0-9]\+.[0-9]\+'`
binutils=`ls -1 /usr/src | grep -o 'binutils-[0-9]\+.[0-9]\+\(.[0-9]\+\)\?'`

echo "Building $gcc and $binutils for target $target."

mkdir -p /usr/cross
mkdir -p /tmp/toolchain
mkdir -p /tmp/toolchain/build-binutils
mkdir -p /tmp/toolchain/build-gcc

cd /tmp/toolchain/build-binutils
/usr/src/$binutils/configure --target=$target --enable-targets=$targets --prefix=$prefix --disable-nls 2>&1
make -j $(nproc --all) all 2>&1
make install 2>&1

cd /tmp/toolchain/build-gcc
if [[ "$target" = arm-* ]]
then
	/usr/src/$gcc/configure --target=$target --prefix=$prefix --disable-nls --enable-languages=c,c++ --enable-libstdcxx --without-headers --disable-hosted-libstdcxx --with-multilib-list=aprofile,rmprofile 2>&1
else
	/usr/src/$gcc/configure --target=$target --prefix=$prefix --disable-nls --enable-languages=c,c++ --enable-libstdcxx --without-headers --disable-hosted-libstdcxx 2>&1
fi
make -j $(nproc --all) all-gcc 2>&1
make install-gcc 2>&1
make -j $(nproc --all) all-target-libgcc 2>&1
make install-target-libgcc 2>&1
make -j $(nproc --all) all-target-libstdc++-v3 2>&1
make install-target-libstdc++-v3 2>&1

ln -s -f $prefix/bin/* /usr/local/bin/

cd /tmp
rm -rf /tmp/toolchain
rm -rf /usr/src/$gcc
rm -rf /usr/src/$binutils
