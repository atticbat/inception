if [ ! -f ./srcs/requirements/nginx/tools/site.crt ] || [ ! -f ./srcs/requirements/nginx/tools/site.key ]; then

    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out ./srcs/requirements/nginx/tools/site.crt \
        -keyout ./srcs/requirements/nginx/tools/site.key \
        -subj "/C=DE/ST=Heilbronn/L=Heilbronn/O=42 Heilbronn/OU=khatlas/CN=khatlas/"
fi
