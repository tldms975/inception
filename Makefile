DOCKER_COMPOSE_FILE := srcs/docker-compose.yml


all:
	mkdir -p /Users/sielee/data/mariadb
	mkdir -p /Users/sielee/data/wordpress
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

re: down all

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	@if docker ps -a | grep -q mariadb; then docker stop mariadb && docker rm mariadb; else true; fi
	@docker-compose -f srcs/docker-compose.yml down --remove-orphans
	@docker volume rm srcs_db srcs_wp || true

.PHONY: all re down clean
