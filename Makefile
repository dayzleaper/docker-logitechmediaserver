NAME = dayzleaper/docker-logitechmediaserver
VERSION = 7.9.0

.PHONY: all build test tag_latest release ssh

all: build

build:
	docker build -t $(NAME):$(VERSION) .

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

run:
	docker run \
		-d \
		-p 3483:3483 \
		-p 9000:9000 \
		-p 9090:9090 \
		-v /share/CACHEDEV1_DATA/docker/logitechmediaserver:/config \
		--name logitechmediaserver \
		$(NAME):$(VERSION)
