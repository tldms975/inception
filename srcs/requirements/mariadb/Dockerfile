FROM debian:buster-slim

COPY ./tools/mariadb.sh /mariadb.sh

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mariadb-server \
    mariadb-client && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod +x mariadb.sh && \
    rm -rf /etc/mysql/mariadb.conf.d/*

COPY ./conf/mysqld.conf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

ENTRYPOINT ["sh", "/mariadb.sh"]