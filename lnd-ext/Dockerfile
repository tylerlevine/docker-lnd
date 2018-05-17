FROM lightninglabs/lnd:latest

MAINTAINER Andreas Lingenhag <11538311+alingenhag@users.noreply.github.com>

RUN apk update && \
    apk add --no-cache openssl \
 && rm -rf /var/cache/apk/*

WORKDIR /
ADD start-lnd-ext.sh .
ENTRYPOINT ["/start-lnd-ext.sh"]
