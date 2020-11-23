FROM runmymind/docker-android-sdk:lazydl

RUN \
  apt update && \
  apt install -yq curl openjdk-8-jre-headless python3 python3-distutils libicu60 libxml2 gcc && \
  update-java-alternatives -s java-1.8.0-openjdk-amd64

RUN \
  curl -L https://github.com/facebook/buck/releases/download/v2020.10.21.01/buck.2020.10.21.01_all.deb -o buck.deb && \
  dpkg -i buck.deb && \
  rm buck.deb

COPY entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
