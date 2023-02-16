#! /bin/bash

#apt update
#chown www-data:www-data /var/www/wordpress -R
#chmod -R 777 /var/www/wordpress
mkdir -p /var/www/html/nflan.42.fr
pushd /var/www/html/nflan.42.fr
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
chown -R wordpress: /var/www/html/nflan.42.fr/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp config create --dbname=wordpress --dbuser=nflan42 --dbpass=nflan42 --dbhost=mariadb --allow-root
sleep infinity
