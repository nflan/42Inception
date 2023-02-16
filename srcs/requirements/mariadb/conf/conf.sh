#! /bin/bash

<<<<<<< HEAD

test -d '/var/run/mysqld/' || mkdir '/var/run/mysqld' && chmod 0755 '/var/run/mysqld' && touch '/var/run/mysqld/mysqld.sock' && chmod 0755 '/var/run/mysqld/mysqld.sock' && chown mysql:mysql '/var/run/mysqld/' -R

	cat << BLOCK > /tmp/config.sql
ALTER USER '${DATABASE_ADM}'@'localhost' IDENTIFIED BY '${DATABASE_PASSWORD}';
CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_UPASS}';
CREATE DATABASE ${DATABASE_WP};
GRANT ALL PRIVILEGES ON ${DATABASE_WP} . * TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_UPASS}';
=======
if test -d /home/nflan/data/mariadb/wordpress
then
cat << OEF > /tmp/config.sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'incept42';
CREATE USER 'nflan42'@'%' IDENTIFIED BY 'nflan42';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress . * TO 'nflan42'@'%' IDENTIFIED BY 'nflan42';
>>>>>>> a681295 (Starting wordpress and get dependances)
FLUSH PRIVILEGES;
BLOCK

<<<<<<< HEAD
service mysql start &> /dev/null
=======
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
>>>>>>> a681295 (Starting wordpress and get dependances)

sleep 1

while [ [ ! mysqladmin -uroot --password="" status &> /dev/null ] && [ ! mysqladmin -uroot --password="${DATABASE_PASSWORD}" status &> /dev/null ] ] 
do
	echo "Waiting for service"
	sleep 1
done

test -d /var/lib/mysql/wordpress || (echo "Configuring Database" && mysql -uroot --password="" < /tmp/config.sql)
mysqladmin --user=${DATABASE_ADM} --password=${DATABASE_PASSWORD} shutdown

sleep 1

echo "Starting Mysql"
exec mysqld --bind-address=0.0.0.0
