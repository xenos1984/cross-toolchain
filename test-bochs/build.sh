#!/bin/sh
set -e

cd /usr/src
svn co http://svn.code.sf.net/p/bochs/code/trunk/bochs bochs
cd bochs

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-x86-64 --enable-avx --enable-smp --enable-memtype --enable-debugger --enable-disasm --disable-debugger-gui
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`64mpdbg

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-x86-64 --enable-avx --enable-smp --enable-memtype
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`64mp

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-x86-64 --enable-avx --enable-memtype --enable-debugger --enable-disasm --disable-debugger-gui
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`64dbg

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-x86-64 --enable-avx --enable-memtype
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`64

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-cpu-level=6 --enable-smp --enable-memtype --enable-debugger --enable-disasm --disable-debugger-gui
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`686mpdbg

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-cpu-level=6 --enable-smp --enable-memtype
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`686mp

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-cpu-level=6 --enable-memtype --enable-debugger --enable-disasm --disable-debugger-gui
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`686dbg

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --enable-usb --enable-pci --enable-cpu-level=6 --enable-memtype
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`686

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --disable-usb --disable-pci --enable-cpu-level=4 --disable-memtype --enable-debugger --enable-disasm --disable-debugger-gui
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`486dbg

./configure --with-x11 --with-sdl2 --with-term --with-nogui --disable-docbook --disable-usb --disable-pci --enable-cpu-level=4 --disable-memtype
make -j $(nproc --all) all
make install
make clean
mv `which bochs` `which bochs`486

cd ..
rm -rf bochs
