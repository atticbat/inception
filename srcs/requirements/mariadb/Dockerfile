FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache \
    mariadb mariadb-client

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./tools/init.sql /tmp/init.sql
# ENV MYSQL_ROOT_PWD=$MYSQL_ROOT_PWD
# ENV WP_DATABASE_NAME=$WP_DATABASE_NAME
# ENV WP_DATABASE_USR=$WP_DATABASE_USR
# ENV WP_DATABASE_PWD=$WP_DATABASE_PWD
RUN if [ ! -d "/run/mysqld" ]; then \
	mkdir -p /run/mysqld \
	chown -R mysql:mysql /run/mysqld \
fi \
if [ ! -d "/var/lib/mysql/mysql" ]; then \
	chown -R mysql:mysql /var/lib/mysql \
	chown mysql:mysql /tmp/init.sql \
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm \
	echo "HI" \
	echo $MYSQL_ROOT_PWD \
	sed -i "s/mysqlrootpwd/$MYSQL_ROOT_PWD/g" /tmp/init.sql \
	sed -i "s/wpdatabasename/$WP_DATABASE_NAME/g" /tmp/init.sql \
	sed -i "s/wpdatabaseusr/$WP_DATABASE_USR/g" /tmp/init.sql \
	sed -i "s/wpdatabasepwd/$WP_DATABASE_PWD/g" /tmp/init.sql \
	/usr/bin/mysqld --user=root --bootstrap < /tmp/init.sql \
	rm /tmp/init.sql \
fi
# RUN /bin/sh /tmp/setup.sh
ENTRYPOINT [ "/usr/bin/mysqld_safe",  "--bind-address=0.0.0.0", \
    "--skip-networking=0", "--general-log=1", "--console", \
    "--user=mysql", "--log-error=/var/log/mysql/error.log", \
    "--general-log-file=/var/log/mysql/general.log" ]