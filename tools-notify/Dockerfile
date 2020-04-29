FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Tallinn

RUN apt-get update && apt-get install -y pkg-config locales ii netcat-openbsd sendxmpp wget ircii irssi weechat

RUN locale-gen "en_US.UTF-8"
