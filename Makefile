NAME	:= Inception
YML	:= srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	mkdir -p /home/ldevoude/data/wordpress
	mkdir -p /home/ldevoude/data/mariadb
	docker compose -f $(YML) up --build -d

down:
	docker compose -f $(YML) down

up:
	docker compose -f $(YML) up -d

clean:
	- docker container stop $$(docker container ps -aq)
	- docker container rm $$(docker container ps -aq)
	- docker image rm -f $$(docker image ls -aq)
	- docker volume rm $$(docker volume ls -q)
	- docker network rm $(shell docker network ls --filter type=custom -q)

fclean: clean volume

prune:
	docker system prune --all --volumes

volume:
	sudo rm -rf /home/ldevoude/data/wordpress/
	sudo rm -rf /home/ldevoude/data/mariadb/
	sudo rm -rf /home/ldevoude/data/

logs: 
	docker compose -f $(YML) logs

re:	fclean all