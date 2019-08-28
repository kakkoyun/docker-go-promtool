PROMTOOL_VERSION=2.12.0
DOCKER_REPO=kakkoyun/go-promtool
DOCKER_IMAGE=${DOCKER_REPO}:${PROMTOOL_VERSION}

.DEFAULT_GOAL := push

.PHONY: build
build:
	docker build --build-arg PROMTOOL_VERSION=${PROMTOOL_VERSION} -t ${DOCKER_IMAGE} -t ${DOCKER_REPO}:latest .

.PHONY: push
push: build
	docker push ${DOCKER_REPO}
