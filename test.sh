#!/bin/sh

# shellcheck disable=SC1091
. ./secret.env

MOUNT_POINT=./test/mnt/s3backup-dev/restic
mkdir -p "$MOUNT_POINT"


sudo docker run                                 \
    --rm -it                                    \
    --volume "$(pwd)":/rootfs:ro                \
    --mount type=bind,src="$MOUNT_POINT",dst=/mnt/restic,bind-propagation=shared \
    --network s3                                \
    --name s3backup-dev                         \
    --env RCLONE_MAX_TRY=5                      \
    --env RESTIC_PASSWORD="$RESTIC_PASSWORD"    \
    --env S3_ACCESS_KEY="$S3_ACCESS_KEY"        \
    --env S3_ENDPOINT="$S3_ENDPOINT"            \
    --env S3_PATH="$S3_PATH"                    \
    --env S3_REGION="$S3_REGION"                \
    --env S3_PROVIDER="$S3_PROVIDER"            \
    --env S3_SECRET_KEY="$S3_SECRET_KEY"        \
    --privileged \
    altaris/s3backup:arm64 "$@"
