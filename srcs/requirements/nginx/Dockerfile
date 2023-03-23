FROM alpine:3.17
RUN apk update && apk upgrade
RUN apk add --no-cache nginx
RUN mkdir -p /usr/share/nginx/html /etc/nginx/ssl/private /etc/nginx/ssl/certs /run/nginx
# RUN --mount=type=secret,id=ssl_crt,dst=/etc/nginx/ssl/certs/site.crt \
#   --mount=type=secret,id=ssl_key,dst=/etc/nginx/ssl/private/site.key
COPY ./tools/index.html /var/www/html/index.html
COPY ./conf/mynginx.conf /tmp/mynginx.conf
COPY --from=0 /run/secrets/ssl_crt /etc/nginx/ssl/certs/site.crt
COPY --from=0 /run/secrets/ssl_key /etc/nginx/ssl/private/site.key
# COPY /run/secrets/ssl_crt /etc/nginx/ssl/certs/site.crt
# COPY /run/secrets/ssl_key /etc/nginx/ssl/private/site.key

ENTRYPOINT [ "nginx", "-c", "/tmp/mynginx.conf", "-g", "daemon off;"]
# ENTRYPOINT [ "tail", "-f" ]
