FROM fuzzle/lnd:latest

MAINTAINER Andreas Lingenhag <11538311+alingenhag@users.noreply.github.com>

#WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd

RUN apk update && \
    apk add --no-cache openssl \
 && rm -rf /var/cache/apk/*

ADD start-lnd-ext.sh .
ENTRYPOINT ["./start-lnd-ext.sh"]
