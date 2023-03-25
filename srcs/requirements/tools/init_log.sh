if [ ! -d ./srcs/requirements/logs ]; then
    mkdir -p ./srcs/requirements/logs
fi

if [ ! -f ./srcs/requirements/logs/mariadb_general.log ]; then
    touch ./srcs/requirements/logs/mariadb_general.log 
fi

if [ ! -f ./srcs/requirements/logs/mariadb_error.log ]; then
    touch ./srcs/requirements/logs/mariadb_error.log 
fi

if [ ! -f ./srcs/requirements/logs/nginx_access.log ]; then
    touch ./srcs/requirements/logs/nginx_access.log 
fi

if [ ! -f ./srcs/requirements/logs/nginx_error.log ]; then
    touch ./srcs/requirements/logs/nginx_error.log 
fi