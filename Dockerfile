FROM ubuntu:18.04

RUN \
  apt update && \
  apt install -yq curl openjdk-8-jre-headless python2.7 libicu60 libxml2 gcc

RUN \
  curl -L https://github.com/facebook/buck/releases/download/v2020.10.21.01/buck.2020.10.21.01_all.deb -o buck.deb && \
  dpkg -i buck.deb && \
  rm buck.deb

RUN ln -s /usr/bin/python2.7 /usr/bin/python

COPY entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
