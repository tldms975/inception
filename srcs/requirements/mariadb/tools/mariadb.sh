#!/bin/sh

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
  mysql_install_db --datadir=/var/lib/mysql --auth-root-authentication-method=normal >/dev/null
  mysqld --bootstrap << EOF
use mysql;

flush privileges;

create database $MYSQL_DATABASE;
create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';

alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';

flush privileges;
EOF
fi

echo "\

--------------------
@mariadb ready
@port:3306
--------------------
"

exec mysqld --datadir=/var/lib/mysql