FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache \
    mariadb mariadb-client

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./tools/init.sql /tmp/init.sql
RUN /bin/sh /tmp/setup.sh
ENTRYPOINT [ "/usr/bin/mysqld_safe",  "--bind-address=0.0.0.0", \
    "--skip-networking=0", "--general-log=1", "--console", \
    "--user=mysql", "--log-error=/var/log/mysql/error.log", \
    "--general-log-file=/var/log/mysql/general.log" ]