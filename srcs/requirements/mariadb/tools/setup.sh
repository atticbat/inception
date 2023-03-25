#!/bin/sh

# chown -R mysql:mysql /var/log/mysql

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	chown -R mysql:mysql /var/lib/mysql
	chown mysql:mysql /tmp/init.sql

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

	echo $MYSQL_ROOT_PWD
	sed -i "s/mysqlrootpwd/$MYSQL_ROOT_PWD/g" /tmp/init.sql
	sed -i "s/wpdatabasename/$WP_DATABASE_NAME/g" /tmp/init.sql
	sed -i "s/wpdatabaseusr/$WP_DATABASE_USR/g" /tmp/init.sql
	sed -i "s/wpdatabasepwd/$WP_DATABASE_PWD/g" /tmp/init.sql
	/usr/bin/mysqld --user=root --allow-root --bootstrap < /tmp/init.sql
	rm /tmp/init.sql
fi

