
IMAGE := text-mining-tutorial/latest
DOCKER_BINARY := docker

run: build
		$(DOCKER_BINARY) run -d -p 8080:8080 -ti $(IMAGE)

run-notebook: build
		$(DOCKER_BINARY) run -d -p 8080:8080 -v ./notebooks:/text-mining-tutorial/notebooks/ jupyter notebook

build:
		$(DOCKER_BINARY) build -t $(IMAGE):latest .

clean-images:
		$(DOCKER_BINARY) rmi $(shell $(DOCKER_BINARY) images -f dangling=true -q)

clean-containers:
		$(DOCKER_BINARY) rm -f $(shell $(DOCKER_BINARY) ps -aq)
