#!/bin/sh

# shellcheck disable=SC1091
. ./secret.env

sudo docker run                              \
    --rm -it                                 \
    --volume "$DATA_VOLUME":/rootfs          \
    --env RESTIC_PASSWORD="$RESTIC_PASSWORD" \
    --env S3_ACCESS_KEY="$S3_ACCESS_KEY"     \
    --env S3_ENDPOINT="$S3_ENDPOINT"         \
    --env S3_PATH="$S3_PATH"                 \
    --env S3_REGION="$S3_REGION"             \
    --env S3_SECRET_KEY="$S3_SECRET_KEY"     \
    s3backup:"$(git rev-parse --abbrev-ref HEAD)" "$@"
