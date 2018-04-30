#!/bin/bash
set -e

gcc_version=`wget -O - ftp://ftp.gnu.org/gnu/gcc/ | grep -o 'gcc-[0-9]\+.[0-9]\+.[0-9]\+' | sed 's/gcc-//' | sort -V | tail -n 1`
binutils_version=`wget -O - ftp://ftp.gnu.org/gnu/binutils/ | grep -o 'binutils-[0-9]\+.[0-9]\+\(.[0-9]\+\)\?' | sed 's/binutils-//' | sort -V | tail -n 1`
newlib_version=`wget -O - ftp://sources.redhat.com/pub/newlib/ | grep -o 'newlib-[0-9]\+.[0-9]\+.[0-9]\+\?' | sed 's/newlib-//' | sort -V | tail -n 1`

echo "Latest gcc version: $gcc_version"
echo "Latest binutils version: $binutils_version"

mkdir -p /usr/src
cd /usr/src

wget -c -O /tmp/gcc-$gcc_version.tar.xz ftp://ftp.gnu.org/gnu/gcc/gcc-$gcc_version/gcc-$gcc_version.tar.xz
tar -xf /tmp/gcc-$gcc_version.tar.xz
rm /tmp/gcc-$gcc_version.tar.xz

wget -c -O /tmp/binutils-$binutils_version.tar.bz2 ftp://ftp.gnu.org/gnu/binutils/binutils-$binutils_version.tar.bz2
tar -xf /tmp/binutils-$binutils_version.tar.bz2
rm /tmp/binutils-$binutils_version.tar.bz2

wget -c -O /tmp/newlib-$newlib_version.tar.gz ftp://sources.redhat.com/pub/newlib/newlib-$newlib_version.tar.gz
tar -xf /tmp/newlib-$newlib_version.tar.gz
rm /tmp/newlib-$newlib_version.tar.gz

