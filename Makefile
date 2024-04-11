DATADIR=/Users/jihyeole/data
DOCKERCOMPOSE = ./srcs/docker-compose.yml

all:
	mkdir -p $(DATADIR)/db
	mkdir -p $(DATADIR)/wp
	docker-compose -f $(DOCKERCOMPOSE) build 
	docker-compose -f $(DOCKERCOMPOSE) up -d 

stop:
	docker-compose -f $(DOCKERCOMPOSE) down

clean:
	docker-compose -f $(DOCKERCOMPOSE) down --rmi all --volumes

fclean: clean
	sudo rm -rf $(DATADIR)

re: fclean all

.PHONY: all stop clean fclean re