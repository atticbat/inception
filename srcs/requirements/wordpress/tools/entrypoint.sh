#!/bin/sh

adduser -S nginx &&	addgroup -S nginx
wget https://github.com/wp-cli/wp-cli/releases/download/v2.7.1/wp-cli-2.7.1.phar
chmod +x wp-cli-2.7.1.phar
cp wp-cli-2.7.1.phar /usr/bin/wp
cd /var/www/html/wordpress

mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME
#sleep 4
#while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME; do
#    sleep 1
#done

if [ ! -f "./wp-config.php" ]; then

    wp core download --allow-root
    wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    wp theme install twentytwentytwo --activate --allow-root
    wp cli update --yes --allow-root
    wp plugin update --all --allow-root

else
    echo "Wordpress already downloaded"
fi

echo "Wordpress started on port 9000"
exec /usr/sbin/php-fpm81 -F -R