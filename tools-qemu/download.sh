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
@@ -383,8 +383,10 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
         assert(sizeof(backend->host_nodes) >=
                BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
         assert(maxnode <= MAX_NODES);
-        if (mbind(ptr, sz, backend->policy,
-                  maxnode ? backend->host_nodes : NULL, maxnode + 1, flags)) {
+
+        if (maxnode &&
+            mbind(ptr, sz, backend->policy, backend->host_nodes, maxnode + 1,
+                  flags)) {
             if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
                 error_setg_errno(errp, errno,
                                  "cannot bind memory to host NUMA nodes");
EOF
