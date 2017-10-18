
IMAGE := text-mining-tutorial/latest
DOCKER_BINARY := docker

run: build
		sudo $(DOCKER_BINARY) run -d -p 8080:8080 -ti $(IMAGE)

build:
		sudo $(DOCKER_BINARY) build -t $(IMAGE):latest .

clean-images:
		sudo $(DOCKER_BINARY) rmi $(shell sudo $(DOCKER_BINARY) images -f dangling=true -q)

clean-containers:
		sudo $(DOCKER_BINARY) rm -f $(shell sudo $(DOCKER_BINARY) ps -aq)
