IMAGE = "docker-dev-env"

build:
	printf "Building container\n"
	docker build --rm -t $(IMAGE) .
.PHONY: build
