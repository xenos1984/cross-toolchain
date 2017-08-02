FROM xenos1984/cross-source:latest

RUN ls /usr/src
RUN ls -1 /usr/src | grep -o 'gcc-[0-9]\+.[0-9]\+.[0-9]\+'
RUN ls -1 /usr/src | grep -o 'binutils-[0-9]\+.[0-9]\+\(.[0-9]\+\)\?'
RUN ls -1 /usr/src | grep -o 'newlib-[0-9]\+.[0-9]\+.[0-9]\+'
RUN /usr/bin/toolchain.sh i686-pc-elf

