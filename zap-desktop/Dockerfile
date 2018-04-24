FROM node:8

MAINTAINER Andreas Lingenhag <11538311+alingenhag@users.noreply.github.com>

USER root

WORKDIR /
ADD start-zap-desktop.sh .

WORKDIR /tmp

RUN apt-get update && apt-get install -y git libgtk2.0-0\
	libx11-xcb-dev\
	libxtst6\
	libxss1
RUN apt-get install -y libgconf-2-4
RUN apt-get install -y libnss3-dev
RUN apt-get install -y libasound2

RUN npm install yarn
RUN git clone https://github.com/LN-Zap/zap-desktop.git
RUN cd zap-desktop && yarn && npm run install-grpc

ENTRYPOINT ["/start-zap-desktop.sh"]
