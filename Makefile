DOCKER_COMPOSE_FILE := srcs/docker-compose.yml


all: $(UP)

up:
	mkdir -p /Users/sielee/data/mariadb
	mkdir -p /Users/sielee/data/wordpress
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	@if docker ps -a | grep -q mariadb; then docker stop mariadb && docker rm mariadb; else true; fi
	@docker-compose -f srcs/docker-compose.yml down --remove-orphans
	@docker volume rm srcs_db srcs_wp || true

fclean	: clean
	rm -rf ${VOLUME_PATH}/data
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

re: down fclean all

.PHONY: all re down clean
