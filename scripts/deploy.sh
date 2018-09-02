#!/usr/bin/env bash

set -efux

gutenberg build --output-dir docker/public

docker build . --file docker/Dockerfile --tag originalhat/pcf-handbook

docker push originalhat/pcf-handbook:latest

cf push pcf-handbook --docker-image originalhat/pcf-handbook

