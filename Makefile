# Variables
DOCKER_COMPOSE_FILE=docker-compose.yml

# Phony Targets
.PHONY: all clean fclean re

all: build

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

clean:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --remove-orphans

fclean: clean
	docker volume rm srcs_data
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb

re: fclean all
