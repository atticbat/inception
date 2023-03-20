all: clean
	docker-compose -f ./srcs/docker-compose.yml up --build

stop:
	docker-compose -f ./srcs/docker-compose.yml down 

clean: stop
	docker system prune --all --force --volumes

fclean: clean
	rm -rf ./srcs/requirements/db_volume
	rm -rf ./srcs/requirements/wp_volume
	mkdir ./srcs/requirements/db_volume
	mkdir ./srcs/requirements/wp_volume

.PHONY: all clean fclean stop