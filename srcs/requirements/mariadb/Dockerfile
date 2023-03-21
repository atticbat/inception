FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache \
    mariadb mariadb-client

COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
COPY ./tools/init.sql /tmp/init.sql
EXPOSE 3306
ENTRYPOINT [ "/bin/sh", "/tmp/entrypoint.sh" ]