#! /bin/bash

if [ ! -d /var/lib/mysql/wordpress ]
then
	cat << BLOCK > /tmp/config.sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'incept42';
CREATE USER 'nflan42'@'%' IDENTIFIED BY 'nflan42';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress . * TO 'nflan42'@'%' IDENTIFIED BY 'nflan42';
FLUSH PRIVILEGES
BLOCK

service mysql start
until mysql -uroot --password="" &>/dev/null
do
	echo "Waiting for service"
	sleep 1
done
sleep 1
mysql -uroot --password="" < /tmp/config.sql
mysqladmin --user=root --password=incept42 shutdown
sleep 1
fi
exec mysqld --bind-address=0.0.0.0
