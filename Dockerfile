FROM alpine:latest

# Metadatas
MAINTAINER Cédric HT

# Package installation through apk
RUN apk add                                                             \
    --no-cache                                                          \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community    \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main         \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing      \
    --update                                                            \
    ca-certificates restic rclone

# Setup executables
ENV PATH /app:$PATH
COPY backup /app/

# Initial state
WORKDIR /
ENTRYPOINT ["backup"]
CMD [""]