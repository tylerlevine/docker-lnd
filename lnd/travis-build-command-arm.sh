#!/bin/sh

# exit script on any error
set -e

mkdir -p docker/lnd

./download-lnd-docker-files.sh
./docker-build-arm-command.sh
