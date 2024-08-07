IMAGE 	= s3backup
SUDO 	= sudo
USER 	= altaris

all: build push


build: build-amd64 build-arm32v7 build-arm64

build-amd64:
	$(SUDO) docker build -f Dockerfile -t $(USER)/$(IMAGE):amd64 --platform linux/amd64 .
	$(SUDO) docker build -f Dockerfile -t $(USER)/$(IMAGE):latest --platform linux/amd64 .

build-arm32v7:
	$(SUDO) docker build -f Dockerfile.arm32v7 -t $(USER)/$(IMAGE):arm32v7 --platform linux/arm32v7 .

build-arm64:
	$(SUDO) docker build -f Dockerfile -t $(USER)/$(IMAGE):arm64 --platform linux/arm64 .

push: push-amd64 push-arm32v7 push-arm64

push-amd64:
	-$(SUDO) docker push $(USER)/$(IMAGE):amd64
	-$(SUDO) docker push $(USER)/$(IMAGE):latest

push-arm32v7:
	-$(SUDO) docker push $(USER)/$(IMAGE):arm32v7

push-arm64:
	-$(SUDO) docker push $(USER)/$(IMAGE):arm64