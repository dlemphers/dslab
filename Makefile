PROJECT=dslab
CONTAINER_IMAGE=dlemphers/dslab:latest

build-notebook-base:
	docker build --rm -t \
	$(CONTAINER_IMAGE) \
	-f .docker/Dockerfile .docker
	docker push $(CONTAINER_IMAGE)


up:
	-\
	PROJECT=$(PROJECT) \
	CONTAINER_IMAGE=$(CONTAINER_IMAGE) \
	docker-compose \
		-f .docker-compose/dslab.yaml \
		up --force-recreate -d

	# Docker is going to own our working folders, need to reclaim them


	@docker ps -aqf "name=$(PROJECT)" | xargs docker \
    	inspect --format 'http://{{.NetworkSettings.Networks.$(PROJECT).IPAddress}}:8888' | xargs \
        google-chrome
	 
	docker-compose \
		-f .docker-compose/dslab.yaml \
		logs -f
