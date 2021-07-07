FROM ubuntu:21.04

ENV DEBIAN_FRONTEND=noninteractive

ENV BUILD_PACKAGES \
 git \
 build-essential \
 gcc \
 meson \
 go-md2man \
 systemd \
 golang \
 ninja-build \
 shellcheck \
 bash-completion \
 skopeo \
 cmake \
 pkg-config \
 ca-certificates

ENV CLEANUP_DIRECTORIES \ 
 ~/.cache/* \
 /var/cache/* \
 /var/log/* \
 /var/tmp/* \
 /tmp/*

RUN set -xeu \
 && echo " ----> Update system" \
 && apt-get update \
 && echo " ----> Set timezone" \
 && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
 && echo " ----> Install build packages" \
 && apt-get install --yes --no-install-recommends ${BUILD_PACKAGES} \
 && echo " ----> Cleanup" \
 && apt-get autoremove --yes \
 && apt-get autoclean --yes \
 && apt-get clean --yes \
 && rm --recursive --force ${CLEANUP_DIRECTORIES}

COPY build.sh /build/build.sh

WORKDIR /build