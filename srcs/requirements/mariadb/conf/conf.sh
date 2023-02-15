#! /bin/bash

cat << OEF > /tmp/config.sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'incept42';
CREATE USER 'nflan42'@'localhost' IDENTIFIED BY 'nflan42';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress . * TO 'root'@'localhost' IDENTIFIED BY 'incept42';
FLUSH PRIVILEGES;
OEF

service mysql start
#while service mysql status != 0
#do
#	sleep 1
#done
sleep 5
mysql -uroot --password="" < /tmp/config.sql
service mysql restart
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

