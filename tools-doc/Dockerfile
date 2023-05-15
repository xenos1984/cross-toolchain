FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Tallinn

RUN apt-get update && apt-get install -y make git curl wget locales texlive-full imagemagick pandoc libbatik-java graphviz asciidoc

ADD policy.xml /tmp/policy.xml
RUN mv /tmp/policy.xml /etc/ImageMagick-*/

RUN wget -O /tmp/patch.txt http://github.com/pgf-tikz/pgf/files/3801524/iflinesintersect--use-fpu.txt
RUN patch /usr/share/texlive/texmf-dist/tex/generic/pgf/libraries/pgflibraryintersections.code.tex /tmp/patch.txt

RUN locale-gen "en_US.UTF-8"
