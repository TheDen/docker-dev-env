IMAGE = "docker-dev-env"
MOUNTDIR?=$(shell pwd)

build:
	docker build --rm -t $(IMAGE) .
.PHONY: build

run:
	docker run -it -P $(IMAGE) bash
.PHONY: run

run-mount:
	docker run -it -P -v $(MOUNTDIR):/$$(basename $(MOUNTDIR)) $(IMAGE) bash
.PHONY: run-mount

exec:
	$(eval CONTAINER := $(shell docker ps -f "ancestor=$(IMAGE)" -f "status=running" -q))
	docker exec -it $(CONTAINER) bash
.PHONY: exec

kill:
	  docker ps -f "ancestor=$(IMAGE)" -f "status=running" -q | xargs docker kill
.PHONY: kill
