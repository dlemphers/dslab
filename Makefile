PROJECT=dslab
CONTAINER_TAG_SPACE=dlemphers/dslab:latest

build-notebook-base:
	docker build --rm -t \
	$(CONTAINER_TAG_SPACE) \
	-f .docker/Dockerfile .docker
	docker push $(CONTAINER_TAG_SPACE)


up:
	-docker-compose \
		-f .docker-compose/dev.yaml \
		up --force-recreate -d

	@docker ps -aqf "name=deeptable.web" | xargs docker \
    	inspect --format 'http://{{.NetworkSettings.Networks.deeptable.IPAddress}}' | xargs \
        google-chrome
	 
	docker-compose \
		-f .docker-compose/dev.yaml \
		logs -f
