#!/bin/bash
set -e

gcc_version=`wget -O - ftp://ftp.gnu.org/gnu/gcc/ | grep -o 'gcc-[0-9]\+.[0-9]\+.[0-9]\+' | sed 's/gcc-//' | sort -V | tail -n 1`
binutils_version=`wget -O - ftp://ftp.gnu.org/gnu/binutils/ | grep -o 'binutils-[0-9]\+.[0-9]\+\(.[0-9]\+\)\?' | sed 's/binutils-//' | sort -V | tail -n 1`

echo "Latest gcc version: $gcc_version"
echo "Latest binutils version: $binutils_version"

mkdir -p /usr/src
cd /usr/src

wget -c -O /tmp/gcc-$gcc_version.tar.xz ftp://ftp.gnu.org/gnu/gcc/gcc-$gcc_version/gcc-$gcc_version.tar.xz
tar -xf /tmp/gcc-$gcc_version.tar.xz
rm /tmp/gcc-$gcc_version.tar.xz

if [ ! -f gcc-$gcc_version/gcc/config/i386/t-x86_64-elf ]
then

cat << EOF > gcc-$gcc_version/gcc/config/i386/t-x86_64-elf
# Add libgcc multilib variant without red-zone requirement

MULTILIB_OPTIONS += mno-red-zone
MULTILIB_DIRNAMES += no-red-zone
EOF

fi

patch -u --ignore-whitespace gcc-$gcc_version/gcc/config.gcc << 'EOF'
--- config.gcc
+++ /tmp/config.gcc
@@ -1956,2 +1956,3 @@
 x86_64-*-elf*)
+	tmake_file="${tmake_file} i386/t-x86_64-elf"
 	tm_file="${tm_file} i386/unix.h i386/att.h dbxelf.h elfos.h newlib-stdint.h i386/i386elf.h i386/x86-64.h"
EOF

wget -c -O /tmp/binutils-$binutils_version.tar.bz2 ftp://ftp.gnu.org/gnu/binutils/binutils-$binutils_version.tar.bz2
tar -xf /tmp/binutils-$binutils_version.tar.bz2
rm /tmp/binutils-$binutils_version.tar.bz2
