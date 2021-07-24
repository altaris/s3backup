IMAGE = s3backup
SUDO = sudo

all: build

build:
	$(SUDO) docker build -t $(IMAGE):$$(git rev-parse --abbrev-ref HEAD) .

build-arm32v7:
	$(SUDO) docker build -f Dockerfile.arm32v7 -t altaris/$(IMAGE):arm32v7 --build-arg ARCH=arm32v7 .

push:
	-$(SUDO) docker push altaris/s3backup:$$(git rev-parse --abbrev-ref HEAD)
	-$(SUDO) docker push altaris/s3backup:arm32v7