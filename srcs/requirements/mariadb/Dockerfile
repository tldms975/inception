FROM debian:buster

# install mariadb
RUN apt-get update && \
    apt-get install -y mariadb-server

# copy over custom configurations
COPY conf/ /etc/mysql/mariadb.conf.d/
RUN chown -R mysql:mysql /etc/mysql/mariadb.conf.d/

# copy over tools
COPY tools/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*

# setup entrypoint script
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# expose default mariadb port
EXPOSE 3306

# start mariadb service
CMD ["mysqld"]

