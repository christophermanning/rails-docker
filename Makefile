# track the build timestamp in Dockerfile.build so the Dockerfile is rebuilt when dependencies change
Dockerfile.build: Dockerfile
	docker build -t rails-docker .
	touch $@

clean:
	rm Dockerfile.build

shell: Dockerfile.build
	@docker run --rm -it --volume ./:/src rails-docker /bin/sh
