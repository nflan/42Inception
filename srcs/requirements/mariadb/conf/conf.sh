#! /bin/bash

cat << OEF > config.sql
ALTER USER 'root'@'inception' IDENTIFIED BY 'incept42'
CREATE USER 'nflan42'@'inception' IDENTIFIED BY 'nflan42'
CREATE DATABASE wordpress
GRANT ALL PRIVILEGES ON wordpress * . * TO 'root'@'inception' IDENTIFIED BY 'incept42'
FLUSH PRIVILEGES
OEF

service mysql start
usleep 5
mysql -uroot --password="" < config.sql
/q
mysql -uroot --password="incept42"
sleep infinity
exec mysqld
#se log a mysql avec login root et --password="" < config.sql
# faire un heredoc pour creer le fichier config.sql
# Alter User
# Create User
# database wp
# droits sur la database
#flush
#eof

