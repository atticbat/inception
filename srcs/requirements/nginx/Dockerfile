FROM alpine:3.17
RUN apk update && apk upgrade
RUN apk add --no-cache nginx
RUN mkdir -p /usr/share/nginx/html /etc/nginx/ssl/private /etc/nginx/ssl/certs /run/nginx
# COPY ./tools/index.html /var/www/html/wordpress/index.html
COPY ./conf/mynginx.conf /tmp/mynginx.conf
COPY ./tools/site.crt /etc/nginx/ssl/certs/site.crt
COPY ./tools/site.key /etc/nginx/ssl/private/site.key

ENTRYPOINT [ "nginx", "-c", "/tmp/mynginx.conf", "-g", "daemon off;"]
