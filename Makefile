DATADIR=/home/jihyeole/data
DOCKERCOMPOSE = ./srcs/docker-compose.yml

all: setup up

setup:
	mkdir -p $(DATADIR)/db
	mkdir -p $(DATADIR)/wp

up:
	docker-compose -f $(DOCKERCOMPOSE) build 
	docker-compose -f $(DOCKERCOMPOSE) up -d 

down:
	docker-compose -f $(DOCKERCOMPOSE) down

clean:
	docker-compose -f $(DOCKERCOMPOSE) down --rmi all --volumes

fclean: clean
	sudo rm -rf $(DATADIR)

re: fclean all

.PHONY: all setup up down clean fclean re