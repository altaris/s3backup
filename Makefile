IMAGE 	= s3backup
SUDO 	= sudo
USER 	= altaris

all:
	$(SUDO) docker build --tag $(IMAGE)-dev:local .
