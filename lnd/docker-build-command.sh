#!/bin/sh

# exit script on any error
set -e

# build docker image
docker build -t tylevine/lnd:latest -f docker/lnd/Dockerfile .
