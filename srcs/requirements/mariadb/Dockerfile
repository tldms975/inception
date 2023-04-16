FROM alpine:3.13.5

RUN apk update && \
    apk add mariadb mariadb-client && \
    rm -f /var/cache/apk/*

COPY ./conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--log-error=/var/log/mysql/error.log", "--pid-file=/run/mysqld/mysqld.pid"]
