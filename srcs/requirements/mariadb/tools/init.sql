CREATE DATABASE IF NOT EXISTS mysql.db;

USE mysql.db;

CREATE TABLE IF NOT EXISTS mysql.plugin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INT NOT NULL
);

CREATE USER 'sielee'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON mysql.* TO 'sielee'@'localhost';
