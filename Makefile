PROJECT=dslab
CONTAINER_IMAGE=dlemphers/dslab:latest

build-notebook-base:
	docker build --rm -t \
	$(CONTAINER_IMAGE) \
	-f .docker/Dockerfile .docker
	-docker push $(CONTAINER_IMAGE)


up:
	-\
	PROJECT=$(PROJECT) \
	CONTAINER_IMAGE=$(CONTAINER_IMAGE) \
	docker-compose \
		-f .docker-compose/dslab.yaml \
		up --force-recreate -d

	chmod 777 data
	chmod 777 notebooks

	@docker ps -aqf "name=$(PROJECT)" | xargs docker \
    	inspect --format 'http://{{.NetworkSettings.Networks.$(PROJECT).IPAddress}}:8888' | xargs \
        google-chrome
	 
	PROJECT=$(PROJECT) \
	CONTAINER_IMAGE=$(CONTAINER_IMAGE) \
	docker-compose \
		-f .docker-compose/dslab.yaml \
		logs -f
