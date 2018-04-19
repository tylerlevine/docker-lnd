#!/bin/sh

# exit script on any error
set -e

# download Dockerfile and start-lnd.sh from lnd repository
wget -O docker/lnd/Dockerfile https://raw.githubusercontent.com/lightningnetwork/lnd/master/docker/lnd/Dockerfile
wget -O docker/lnd/start-lnd.sh https://raw.githubusercontent.com/lightningnetwork/lnd/master/docker/lnd/start-lnd.sh

