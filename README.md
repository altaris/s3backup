s3backup
========

This docker image performs incremental backups of a given volume to an s3
storage using [`restic`](https://restic.readthedocs.io/en/latest/) and
[`rclone`](https://rclone.org/).

# Quickstart

```sh
docker run                                                          \
    --rm                                                            \
    --volume datavolume:/rootfs:ro                                  \
    --env RESTIC_PASSWORD="passw0rd"                                \
    --env S3_ACCESS_KEY="XXXYYYYYYYYYYYYYY"                         \
    --env S3_ENDPOINT="po.ta.to"                                    \
    --env S3_PATH="bucket/folder"                                   \
    --env S3_REGION="us-east-1"                                     \
    --env S3_SECRET_KEY="1111111-2222-3333-44444-55555555555555"    \
    altaris/s3backup backup backup
```

# Environment variables

* `RESTIC_PASSWORD`: Password of the `restic` repository.
* `ROOTFS_PATH` (default: `/rootfs`): Absolute path where the volume is
  mounted.
* `S3_ACCESS_KEY`: S3 access key.
* `S3_ENDPOINT`: S3 endpoint.
* `S3_REGION`: S3 region.
* `S3_SECRET_KEY`: S3 secret key.
* `S3_PATH`: Path of the `restic` repository, e.g. `bucket/foo`.
