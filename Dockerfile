FROM alpine:latest

RUN apk add                                                             \
    --no-cache                                                          \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community    \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main         \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing      \
    --update                                                            \
    ca-certificates restic rclone fuse

ENV PATH=/app:$PATH
COPY backup /app/

WORKDIR /
ENTRYPOINT ["backup"]
CMD [""]