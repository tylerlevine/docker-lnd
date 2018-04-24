FROM node:latest

MAINTAINER Andreas Lingenhag <11538311+alingenhag@users.noreply.github.com>

USER root

WORKDIR /tmp

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/mably/lncli-web.git \
 && cd lncli-web \
 && npm install \
 &&  ./node_modules/.bin/gulp bundle


FROM node:latest

EXPOSE 8280

WORKDIR /lncli-web

COPY --from=0 /tmp/lncli-web .

CMD ["/lncli-web/init.sh"]