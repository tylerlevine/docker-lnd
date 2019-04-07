#!/bin/sh

# exit script on any error
set -e

# build docker image
docker build -t tylevine/lnd-ext:latest .

