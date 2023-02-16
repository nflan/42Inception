#! /bin/bash

if test -d /home/nflan/data/mariadb/wordpress
then
cat << OEF > /tmp/config.sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'incept42';
CREATE USER 'nflan42'@'%' IDENTIFIED BY 'nflan42';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress . * TO 'nflan42'@'%' IDENTIFIED BY 'nflan42';
FLUSH PRIVILEGES;
OEF

service mysql start
until mysql -uroot --password="" &>/dev/null
do
	echo "Waiting for service"
	sleep 1
done
sleep 1
echo "Param"
mysql -uroot --password="" < /tmp/config.sql
mysqladmin --user=root --password=incept42 shutdown
sleep 1
fi
exec mysqld --bind-address=0.0.0.0
#se log a mysql avec login root et --password="" < config.sql
# faire un heredoc pour creer le fichier config.sql
# Alter User
# Create User
# database wp
# droits sur la database
#flush
#eof

