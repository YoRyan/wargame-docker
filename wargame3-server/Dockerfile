FROM debian:jessie
MAINTAINER Ryan Young <rayoung@utexas.edu>

RUN dpkg --add-architecture i386 \
  && apt-get update && apt-get install -y --no-install-recommends \
    libc6-i386 \
    libssl1.0.0:i386 \
    libstdc++6:i386 \
    libuuid1:i386 \
    zlib1g:i386 \
  && rm -rf /var/lib/apt/lists/*

ARG EUGEN_SERVER_DOWNLOAD_URL

RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    curl \
  && groupadd -r wargame && useradd -r -d /srv/wargame -m -g wargame wargame \
  && curl --insecure "$EUGEN_SERVER_DOWNLOAD_URL/wargame3_server.tar.bz2" | tar xj -C /srv/wargame wargame3_server \
  && chown -R wargame:wargame /srv/wargame/wargame3_server \
  && apt-get remove -y --purge \
    bzip2 \
    curl \
  && apt-get autoremove -y --purge \
  && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /

WORKDIR /srv/wargame/wargame3_server/
ENTRYPOINT ["/docker-entrypoint.sh"]

USER wargame
CMD ["wargame"]
