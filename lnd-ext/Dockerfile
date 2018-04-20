FROM fuzzle/lnd:latest

MAINTAINER Andreas Lingenhag <11538311+alingenhag@users.noreply.github.com>

WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd
ADD start-lnd-ext.sh .
#RUN chmod +x start-lnd-ext.sh
ENTRYPOINT ["/go/src/github.com/lightningnetwork/lnd/start-lnd-ext.sh"]
