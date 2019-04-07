FROM lnd:latest

MAINTAINER Tyler Levine

ADD start-lnd.sh .
ENTRYPOINT ["./start-lnd.sh"]
