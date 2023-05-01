FROM debian:buster-slim

EXPOSE 443

COPY ./tools/nginx.sh /nginx.sh

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl && \
    mkdir -p /etc/ssl && \
    chmod +x nginx.sh 

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["sh", "/nginx.sh"]
