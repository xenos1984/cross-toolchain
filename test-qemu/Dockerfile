FROM ubuntu:latest

RUN apt-get update && apt-get install -y git build-essential wget autoconf automake libtool texinfo pkg-config locales python-all-dev python3-all-dev zlib1g-dev libglib2.0-dev

ADD build.sh /usr/bin/build.sh

RUN locale-gen "en_US.UTF-8"

RUN /usr/bin/build.sh

