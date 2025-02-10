# s3backup

[![Docker Build
Status](https://img.shields.io/docker/cloud/build/altaris/s3backup)](https://hub.docker.com/r/altaris/s3backup/)
[![MIT
License](https://badgen.net/badge/license/MIT/blue)](https://choosealicense.com/licenses/mit/)

This docker image performs incremental backups of a given volume to an s3
storage using [`restic`](https://restic.readthedocs.io/en/latest/) and
[`rclone`](https://rclone.org/).

## Quickstart

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
    altaris/s3backup:amd64 backup
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
