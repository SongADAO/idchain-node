#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Run this script to build and push an updated image to docker hub.
# link: https://hub.docker.com/r/songadao/idchain-relay

docker pull golang:1.14-alpine
docker pull alpine:latest

docker compose -f docker-compose.release.yml build

docker compose -f docker-compose.release.yml push
