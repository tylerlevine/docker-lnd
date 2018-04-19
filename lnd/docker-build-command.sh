#!/bin/sh

# exit script on any error
set -e

# build docker image
docker build -t fuzzle/lnd:latest -f docker/lnd/Dockerfile .

