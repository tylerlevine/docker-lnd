# Docker Images for lightning
This repository aims at creating docker images for bitcoin lightning related projects.

## Images
### lnd [![Build Status](https://travis-ci.org/tylerlevine/docker-lnd.svg?branch=master)](https://travis-ci.org/tylerlevine/docker-lnd)

This image is automatically built every day from [lightningnetwork/lnd](https://github.com/LightningNetwork/lnd).
It can be pulled from [Docker Hub](https://hub.docker.com/r/tylevine/docker-lnd/).

### lnd-ext [![Build Status](https://travis-ci.org/tylerlevine/docker-lnd.svg?branch=master)](https://travis-ci.org/tylerlevine/docker-lnd)

This is a slightly modified build of the lnd docker image. It supports setting all command line options as environment variables for more convenience.
The supported cli options can be found in ```lnd-ext/start-lnd-ext.sh```.
It is also built automatically every day and can be pulled from [Docker Hub](https://hub.docker.com/r/fuzzle/lnd-ext/) as well.
 
