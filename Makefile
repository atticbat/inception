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
	docker volume rm db_volume wp_volume
	rm -rf /home/${SUDO_USER}/data/wordpress
	rm -rf /home/${SUDO_USER}/data/mysql

.PHONY: all clean fclean
