#!/bin/bash

certPath="/var/www/app/.docker/nginx/certs"

if [[ ! -f "$certPath/ssl.key" ]]; then
	openssl genrsa 2048 > "$certPath/ssl.key"
	openssl req -new -x509 -nodes -days 365 -subj "/C=VN/ST=Ha Noi/L=Ha Noi City/O=Example/OU=Example/CN=Example" -key "$certPath/ssl.key" -out "$certPath/ssl.crt"
fi

exec $@;
