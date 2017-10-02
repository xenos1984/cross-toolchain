FROM ubuntu:latest

RUN apt-get update && apt-get install -y git build-essential wget autoconf automake texinfo pkg-config locales python-all-dev python3-all-dev

ADD build.sh /usr/bin/build.sh

RUN locale-gen "en_US.UTF-8"

RUN /usr/bin/build.sh

