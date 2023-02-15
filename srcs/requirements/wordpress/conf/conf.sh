#! /bin/bash

wget https://fr.wordpress.org/wordpress-latest-fr_FR.zip
unzip wordpress-latest-fr_FR.zip -d /var/www
apt update
chown www-data:www-data /var/www/wordpress -R
chmod -R 777 /var/www/wordpress
sleep infinity
