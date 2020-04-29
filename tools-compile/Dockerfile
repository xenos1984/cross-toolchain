FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Tallinn

RUN apt-get update && apt-get install -y git build-essential curl wget libmpfr-dev libmpc-dev libgmp3-dev autoconf automake texinfo pkg-config locales grub-pc-bin genisoimage netcat-openbsd

RUN locale-gen "en_US.UTF-8"
