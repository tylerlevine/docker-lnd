FROM lnd:latest

MAINTAINER Tyler Levine

ADD start-lnd-ext.sh .
ENTRYPOINT ["./start-lnd-ext.sh"]
