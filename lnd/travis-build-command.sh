#!/bin/sh

# exit script on any error
set -e

mkdir -p docker

./clone-lnd-repo.sh
./docker-build-command.sh