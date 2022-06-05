CT_DOCKER_REPO := ct-docker.artifacts.cloudtrust.rocks

DOCKER_IMAGE_NAME := vault-sidecar
DOCKER_IMAGE_VERSION := ${CT_DOCKER_REPO}/vault/${DOCKER_IMAGE_NAME}:$(shell date -u +%Y%m%d%H%M%S)

all: build image push

build:
	GOOS=linux GOARCH=amd64 go build -o vault-sidecar -ldflags "-s -w"
image:
	docker buildx build -t ${DOCKER_IMAGE_VERSION} --platform=linux/arm64,linux/amd64 . --push
push:
	docker push ${DOCKER_IMAGE_VERSION}