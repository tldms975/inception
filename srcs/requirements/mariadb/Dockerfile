FROM alpine:3.16

RUN apk update && \
    apk add mariadb mariadb-client mariadb-server-utils

RUN mkdir -p /var/run/mysqld && \
    chmod 777 /var/run/mysqld

RUN { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
      echo 'skip-networking=0'; \
    } > /etc/my.cnf.d/docker.cnf


RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./conf/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
CMD ["/usr/bin/mysqld", "--user=mysql", "--skip-log-error"]

