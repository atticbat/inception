if [ ! -f ./srcs/.env ]; then

    mysql_root_pwd=$(cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 10; echo)
    wp_database_pwd=$(cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 10; echo;)
    wp_admin_pwd=$(cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 10; echo;)
    wp_pwd=$(cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 10; echo;)

    echo "MYSQL_HOST=mariadb" > ./srcs/.env
    echo "MYSQL_ROOT_PWD="$mysql_root_pwd >> ./srcs/.env
    echo "WP_DATABASE_NAME=wordpress" >> ./srcs/.env
    echo "WP_DATABASE_USR=khatlas" >> ./srcs/.env
    echo "WP_DATABASE_PWD="$wp_database_pwd >> ./srcs/.env
    echo "DOMAIN_NAME=khatlas.42.fr" >> ./srcs/.env
    echo "WP_TITLE=Inception" >> ./srcs/.env
    echo "WP_ADMIN_USR=bossman" >> ./srcs/.env
    echo "WP_ADMIN_PWD="$wp_admin_pwd >> ./srcs/.env
    echo "WP_ADMIN_EMAIL=kewin.hatlas@gmail.com" >> ./srcs/.env
    echo "WP_USR=khatlas" >> ./srcs/.env
    echo "WP_PWD="$wp_pwd >> ./srcs/.env
    echo "WP_EMAIL=terrormate@gmail.com" >> ./srcs/.env
fi