FROM debian:buster-slim

COPY ./tools/nginx.sh /nginx.sh
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl && \
    mkdir -p /etc/ssl && \
    chmod +x nginx.sh 


EXPOSE 443

ENTRYPOINT ["sh", "/nginx.sh"]
