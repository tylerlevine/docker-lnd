#!/usr/bin/env bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker tag lnd:latest "$DOCKER_USERNAME/lnd:latest"
docker push "$DOCKER_USERNAME/lnd:latest"
