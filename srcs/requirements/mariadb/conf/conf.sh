#! /bin/bash

#if [ ! -d /var/lib/mysql/wordpress ]
#then
	cat << BLOCK > /tmp/config.sql
ALTER USER '${DATABASE_ADM}'@'localhost' IDENTIFIED BY '${DATABASE_PASSWORD}';
CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_UPASS}';
CREATE DATABASE ${DATABASE_WP};
GRANT ALL PRIVILEGES ON ${DATABASE_WP} . * TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_UPASS}';
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
mysqladmin --user=${DATABASE_ADM} --password=${DATABASE_PASSWORD} shutdown
sleep 1
#fi
exec mysqld --bind-address=0.0.0.0
