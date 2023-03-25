#!/bin/sh

chown -R mysql:mysql /var/log/mysql

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	chown -R mysql:mysql /var/lib/mysql
	chown mysql:mysql /tmp/init.sql

	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

	sed -i "s/mysqlrootpwd/$MYSQL_ROOT_PWD/g" /tmp/init.sql
	sed -i "s/wpdatabasename/$WP_DATABASE_NAME/g" /tmp/init.sql
	sed -i "s/wpdatabaseusr/$WP_DATABASE_USR/g" /tmp/init.sql
	sed -i "s/wpdatabasepwd/$WP_DATABASE_PWD/g" /tmp/init.sql
	/usr/bin/mysqld --user=mysql --bootstrap < /tmp/init.sql
	rm /tmp/init.sql
fi

exec /usr/bin/mysqld_safe --user=mysql --console --bind-address=0.0.0.0 --skip-networking=0 \
	--general-log=1 --general-log-file=/var/log/mysql/general.log --log-error=/var/log/mysql/error.log