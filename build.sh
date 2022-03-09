#!/bin/bash

docker buildx build $DOCKER_ARGS \
    --build-arg SECRET_KEY_BASE=$SECRET_KEY_BASE \
    --build-arg DD_API_KEY=$DD_API_KEY \
    .
