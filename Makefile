IMAGE="docker-dev-env"
MOUNTDIR?= $(shell pwd)
VIMRC?="https://raw.githubusercontent.com/TheDen/dotfiles/master/.vimrc"

build:
	docker build --rm --build-arg VIMRC=$(VIMRC) -t $(IMAGE) .
.PHONY: build

run:
	docker run -it -P $(IMAGE) bash
.PHONY: run

run-with-strace:
	  docker run -it -P --cap-add SYS_PTRACE $(IMAGE) bash
.PHONY: run-with-strace

run-mount:
	docker run -it -P -v $(MOUNTDIR):/$$(basename $(MOUNTDIR)) $(IMAGE) bash
.PHONY: run-mount

run-mount-with-strace:
	  docker run -it -P --cap-add SYS_PTRACE -v $(MOUNTDIR):/$$(basename $(MOUNTDIR)) $(IMAGE) bash
.PHONY: run-mount-with-strace

exec:
	$(eval CONTAINER := $(shell docker ps -f "ancestor=$(IMAGE)" -f "status=running" -q))
	docker exec -it $(CONTAINER) bash
.PHONY: exec

kill:
	  docker ps -f "ancestor=$(IMAGE)" -f "status=running" -q | xargs docker kill
.PHONY: kill
