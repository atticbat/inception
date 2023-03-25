FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache \
		wget				\
        tar                 \
		mariadb-client		\
		php81 php81-fpm php81-bcmath php81-bz2 php81-calendar php81-ctype php81-exif \
		php81-mysqli php-json php81-dom php81-xml php81-curl php81-gd php81-gmp \
		php81-iconv php81-imap php81-intl php81-mysqlnd php81-opcache php81-zip \
		php81-mbstring php81-openssl php81-session php81-phar php81-simplexml \
		php81-xmlwriter php81-tokenizer php81-fileinfo php81-pgsql php81-posix \
	    php81-xmlreader php81-pdo_mysql php81-pcntl php81-pdo php81-pdo_pgsql \
		php81-pdo_sqlite php81-shmop php81-soap php81-sockets php81-sodium \
		php81-sqlite3 php81-sysvsem php81-sysvshm php81-xsl

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY ./conf/php-fpm.conf /etc/php/php-fpm.conf
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT [ "/bin/sh", "/tmp/entrypoint.sh" ]