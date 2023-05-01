#!/bin/sh

openssl req -newkey rsa:4096 -days 30 -nodes -x509 \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=${INTRA_ID}.42.fr" \
    -keyout "/etc/ssl/${INTRA_ID}.42.fr.key" \
    -out "/etc/ssl/${INTRA_ID}.42.fr.crt" 2>/dev/null

echo "127.0.0.1 sielee.42.fr" >> /etc/hosts
sed -i 's/user www-data;/user root;/' /etc/nginx/nginx.conf

echo "\

--------------------
@nginx ready
@port:443
--------------------
"

exec nginx -g 'daemon off;'
