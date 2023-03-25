all: clean
	sh ./srcs/requirements/tools/init_env.sh
	sh ./srcs/requirements/tools/init_ssl.sh
	sh ./srcs/requirements/tools/init_log.sh
	sh ./srcs/requirements/tools/init_vol.sh
	sh ./srcs/requirements/tools/init_hosts.sh
	docker-compose -f ./srcs/docker-compose.yml up --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	rm -rf ./srcs/requirements/logs
	docker system prune --all --force
	docker volume rm db_volume wp_volume --force
	echo "\033[0;31m I'm about to remove your ~/data folder, if you have anything in there then don't type your sudo password :^) \033[0m"
	sudo -k rm -rf /home/${USER}/data

.PHONY: all clean fclean
