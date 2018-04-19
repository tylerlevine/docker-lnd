#!/bin/sh

# exit script on any error
set -e

mkdir -p docker/lnd

lnd/download-lnd-docker-files.sh
lnd/docker-build-command.sh

