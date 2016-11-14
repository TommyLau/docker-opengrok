FROM ubuntu:16.04

MAINTAINER Tommy Lau <tommy@gen-new.com>

# Setup useful environment variables
ENV GROK_HOME		/grok
ENV GROK_VERSION	0.12.1.6
ENV DOWNLOAD_URL    https://github.com/OpenGrok/OpenGrok/files/467358/opengrok-${JIRA_VERSION}.tar.gz.zip
ENV DEBIAN_FRONTEND noninteractive

LABEL Description="This image is used to start OpenGrok" Vendor="Tommy Lau" Version="${JIRA_VERSION}"

# Install needed packages
RUN apt update -qq \
    && apt install -y --no-install-recommends exuberant-ctags tomcat7 openjdk-8-jdk-headless wget unzip \
    && apt clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Get stable version
RUN set -x \
    && mkdir /opengrok \
    && cd /usr/src \
    && wget -c "${DOWNLOAD_URL}" \
    && unzip opengrok-*.zip \
    && tar zxvf -C /opengrok --strip-components=1 opengrok-*.tar.gz

ADD run.sh /rungrok

ENTRYPOINT ["/rungrok"]

EXPOSE 8080
