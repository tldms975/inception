HOSTS_SETUP_SH=./srcs/requirements/tools/hosts.sh
VOLUME_SETUP_SH=./srcs/requirements/tools/volume.sh
FCLEAN_SETUP_SH=./srcs/requirements/tools/fclean.sh

DOCKER_COMPOSE=docker compose --file ./srcs/docker-compose.yml

all: up

up:
	@$(VOLUME_SETUP_SH)
	@$(HOSTS_SETUP_SH)
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down --remove-orphans

clean:
	$(DOCKER_COMPOSE) down --rmi all

fclean: clean
	sudo rm -rf ${HOME}/data
	sudo docker system prune --volumes --all --force
	sudo docker network prune --force
	sudo docker volume prune --force
	@$(FCLEAN_SETUP_SH)

re:
	@make fclean
	@make all

.PHONY: all up down clean fclean re
