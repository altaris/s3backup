IMAGE 	= s3backup
SUDO 	= sudo
USER 	= altaris

all: build-all push-all

build:
	$(SUDO) docker build -t $(USER)/$(IMAGE) .

build-all: build build-arm32v7

build-arm32v7:
	$(SUDO) docker build -f Dockerfile.arm32v7 -t $(USER)/$(IMAGE):arm32v7 --build-arg ARCH=arm32v7 .

push:
	-$(SUDO) docker push $(USER)/$(IMAGE)

push-all: push push-arm32v7

push-arm32v7:
	-$(SUDO) docker push $(USER)/$(IMAGE):arm32v7