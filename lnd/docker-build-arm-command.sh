#!/bin/sh

# exit script on any error
set -e


sed 's/FROM\ golang/FROM\ arm32v7\/golang/' docker/lnd/Dockerfile > docker/lnd/Dockerfile.arm32v7

# build docker image
docker build -t fuzzle/lnd:arm32v7 -f docker/lnd/Dockerfile.arm32v7 .

