-- create database
CREATE DATABASE wordpress;

-- create user and grant permissions
CREATE USER 'wordpress_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'%';

-- flush privileges
FLUSH PRIVILEGES;
