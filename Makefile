NAME = abhas/cerb

all: build push

build:
	docker build -t $(NAME):latest --rm .

push:
	docker push $(NAME)
