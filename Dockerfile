FROM alpine:latest

# Metadatas
MAINTAINER Cédric HT

# Package installation through apk
RUN apk add --no-cache restic rclone

# Setup executables
ENV PATH /app:$PATH
COPY backup /app/

# Initial state
WORKDIR /
CMD backup