
IMAGE := text-mining-tutorial/latest
DOCKER_BINARY := docker

run: build
		$(DOCKER_BINARY) run -d -p 8080:8080 -ti $(IMAGE)

run-notebook: build
		$(DOCKER_BINARY) run -it --rm -p 8888:8888 -v $(CURDIR):/text-mining-tutorial $(IMAGE) \
	    																				jupyter notebook --ip=0.0.0.0 --port 8888 --notebook-dir /text-mining-tutorial --allow-root

build:
		$(DOCKER_BINARY) build -t $(IMAGE):latest .

clean-images:
		$(DOCKER_BINARY) rmi $(shell $(DOCKER_BINARY) images -f dangling=true -q)

clean-containers:
		$(DOCKER_BINARY) rm -f $(shell $(DOCKER_BINARY) ps -aq)
