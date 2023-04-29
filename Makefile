DOCKER_COMPOSE_FILE := srcs/docker-compose.yml
SETUP_SH := ./srcs/requirements/tools/setup.sh

all: up

up:
	@$(SETUP_SH)
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean:
	@if docker ps -a | grep -q mariadb; then docker stop mariadb && docker rm mariadb; else true; fi
	@docker-compose -f srcs/docker-compose.yml down --remove-orphans
	@docker volume rm srcs_db srcs_wp || true

fclean	: clean
	rm -rf ${HOME}/data
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

re: down fclean all

.PHONY: all re down clean
