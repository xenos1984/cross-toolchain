FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Tallinn

RUN apt-get update && apt-get install -y subversion build-essential wget autoconf automake libtool texinfo bison flex pkg-config locales python-all-dev python3-all-dev zlib1g-dev libglib2.0-dev libaio-devlibgtk-3-dev libncurses5-dev libsdl2-dev libx11-dev netcat-openbsd ansifilter

RUN locale-gen "en_US.UTF-8"

ADD build.sh /usr/bin/build.sh

RUN /usr/bin/build.sh
