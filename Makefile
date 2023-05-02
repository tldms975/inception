DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
include ./srcs/.env

all: up

up:
	@mkdir -p ${VOLUME_PATH}/mariadb
	@mkdir -p ${VOLUME_PATH}/wordpress
	# @mkdir -p /Users/sielee/data/mariadb
	# @mkdir -p /Users/sielee/data/wordpress
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	@docker-compose -f srcs/docker-compose.yml down --remove-orphans
	@docker volume rm srcs_db srcs_wp || true

fclean	: clean
	rm -rf /home/sielee/data
	rm -rf /Users/sielee/data
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

re: down fclean all

.PHONY: all up re down clean
