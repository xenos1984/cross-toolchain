FROM ubuntu:latest

RUN apt-get update && apt-get install -y git build-essential wget libmpfr-dev libmpc-dev libgmp3-dev autoconf automake texinfo pkg-config locales grub-pc-bin genisoimage

ADD toolchain.sh /usr/bin/toolchain.sh
ADD download.sh /usr/bin/download.sh

RUN locale-gen "en_US.UTF-8"

RUN /usr/bin/download.sh

