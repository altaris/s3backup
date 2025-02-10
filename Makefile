IMAGE 	= s3backup
SUDO 	= sudo
USER 	= altaris

all: build push

build: build-amd64 build-arm64

build-amd64:
	$(SUDO) docker build --platform linux/amd64 .

build-arm64:
	$(SUDO) docker build --platform linux/arm64 .

push: push-amd64 push-arm64

push-amd64:
	-$(SUDO) docker push $(USER)/$(IMAGE):amd64

push-arm64:
	-$(SUDO) docker push $(USER)/$(IMAGE):arm64