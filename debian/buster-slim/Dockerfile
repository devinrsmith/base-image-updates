FROM debian:buster-slim as updated
RUN set -eux; \
apt-get -qq update; \
apt-get -qq upgrade; \
rm -rf /var/lib/apt/lists/*

FROM updated as sentinel
RUN set -eux; \
apt-get -qq update; \
apt-get -qq upgrade; \
rm -rf /var/lib/apt/lists/*