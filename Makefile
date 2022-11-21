IMAGE_REPO=ghcr.io/trstringer/httpbin
VERSION=$(shell cat ./httpbin/VERSION)
CUSTOM_HEADER_KEY=my-custom-header
CUSTOM_HEADER_VALUE=hello-world

.PHONY: build
build:
	docker build -t $(IMAGE_REPO):latest -t $(IMAGE_REPO):$(VERSION) .

.PHONY: push
push:
	docker push $(IMAGE_REPO):latest
	docker push $(IMAGE_REPO):$(VERSION)

.PHONY: run
run:
	docker run -p 8080:80 --rm -i \
		--env CUSTOM_HEADER_KEY=$(CUSTOM_HEADER_KEY) \
		--env CUSTOM_HEADER_VALUE=$(CUSTOM_HEADER_VALUE) \
		$(IMAGE_REPO):latest
