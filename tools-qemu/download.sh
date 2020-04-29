#!/bin/bash
set -e

version=`wget -O - http://download.qemu.org/ | grep -o 'qemu-[0-9]\+.[0-9]\+.[0-9]\+' | sed 's/qemu-//' | sort -V | tail -n 1`

mkdir -p /usr/src
cd /usr/src

wget -c -O /tmp/qemu-$version.tar.xz http://download.qemu.org/qemu-$version.tar.xz
tar -xf /tmp/qemu-$version.tar.xz
rm /tmp/qemu-$version.tar.xz

cd qemu-$version

patch -u --ignore-whitespace backends/hostmem.c << 'EOF'
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -384,3 +385,3 @@
         if (mbind(ptr, sz, backend->policy,
-                  maxnode ? backend->host_nodes : NULL, maxnode + 1, flags)) {
+                  maxnode ? backend->host_nodes : NULL, 0, flags)) {
             if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
EOF
