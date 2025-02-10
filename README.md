# s3backup

[![License](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
[![DockerHub](https://img.shields.io/badge/Docker_image-blue?logo=docker)](https://hub.docker.com/r/altaris/s3backup)

This docker image performs incremental backups of a given volume to an s3
storage using [`restic`](https://restic.readthedocs.io/en/latest/) and
[`rclone`](https://rclone.org/).

## Quickstart

```sh
docker run                          \
    --rm                            \
    --volume your-volume:/rootfs:ro \
    --env RESTIC_PASSWORD="..."     \
    --env S3_ACCESS_KEY="..."       \
    --env S3_ENDPOINT="po.ta.to"    \
    --env S3_PATH="bucket/folder"   \
    --env S3_REGION="us-east-1"     \
    --env S3_SECRET_KEY="..."       \
    altaris/s3backup backup
```

## Environment variables

- `RCLONE_EXTRA_CONFIG` (default: empty): Extra configuration for `rclone`. For
  example, for a Scaleway endpoint, you might want to set it to `acl private env_auth false`.
- `RCLONE_MAX_TRY` (default: `5`): Number of attempts to connect to container
  `rclone` server; set this to higher values on slower systems.
- `RESTIC_DURATION` (default: `10y`): Duration for which backups should be
  kept, see
  [here](https://restic.readthedocs.io/en/latest/060_forget.html#removing-snapshots-according-to-a-policy).
- `RESTIC_PASSWORD`: Password of the `restic` repository.
- `ROOTFS_PATH` (default: `/rootfs`): Absolute path where the volume is
  mounted.
- `S3_ACCESS_KEY`: S3 access key.
- `S3_ENDPOINT`: S3 endpoint.
- `S3_REGION`: S3 region.
- `S3_SECRET_KEY`: S3 secret key.
- `S3_PATH`: Path of the `restic` repository, e.g. `bucket/foo`.
- `S3_PROVIDER` (default: `AWS`): Any S3 provided supported by `rclone`, see
  [here](https://rclone.org/s3/).

## Mount a restic repository

This will mount the restic repository at `/mnt/restic`, and the latest snapshot
will be available at `/mnt/restic/snapshots/latest/rootfs`.

```sh
sudo docker run                     \
    --rm                            \
    --env RESTIC_PASSWORD="..."     \
    --env S3_ACCESS_KEY="..."       \
    --env S3_ENDPOINT="po.ta.to"    \
    --env S3_PATH="bucket/folder"   \
    --env S3_REGION="us-east-1"     \
    --env S3_SECRET_KEY="..."       \
    --mount type=bind,src="$MOUNT_POINT",dst=/mnt/restic,bind-propagation=shared \
    --privileged \
    altaris/s3backup "$@"
```
