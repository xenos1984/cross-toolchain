FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Tallinn

RUN apt-get update && apt-get install -y make git curl wget locales texlive-full imagemagick pandoc libbatik-java graphviz asciidoc

ADD policy.xml /tmp/policy.xml
RUN mv /tmp/policy.xml /etc/ImageMagick-*/

RUN locale-gen "en_US.UTF-8"
