# Variables
DOCKER_COMPOSE_FILE=srcs/docker-compose.yml

# Phony Targets
.PHONY: all build clean fclean re

all: build

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

clean:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --remove-orphans

fclean: clean
	docker volume rm
	docker volume rm
	docker volume rm

re: fclean all
