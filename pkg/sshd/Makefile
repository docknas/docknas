.PHONY: tag push
default: push

ORG?=docknas
IMAGE=sshd
DEPS=Dockerfile

## TODO: This is dirty, as it always uses the hash of HEAD, even if there are pending changes in the working copy
HASH?=$(shell git ls-tree HEAD -- ../$(notdir $(CURDIR)) | awk '{print $$3}')

tag: $(DEPS)
	docker build --squash --no-cache -t $(ORG)/$(IMAGE):$(HASH) .

push: tag
	DOCKER_CONTENT_TRUST=1 docker pull $(ORG)/$(IMAGE):$(HASH) || \
	DOCKER_CONTENT_TRUST=1 docker push $(ORG)/$(IMAGE):$(HASH)
