#! /bin/bash

#apt update
mkdir -p /var/www/html/nflan.42.fr
pushd /var/www/html/nflan.42.fr
#wget https://wordpress.org/latest.tar.gz
#tar -xvzf latest.tar.gz
#chown -R www-data:www-data /var/www/html/nflan.42.fr/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
if [ ! -f wp-config.php ]
then
	wp core download --allow-root
	wp config create --dbname=wordpress --dbuser=nflan42 --dbpass=nflan42 --dbhost=mariadb --allow-root
	wp core install --url=nflan.42.fr --title=Inception --admin_user=supervisor --prompt=admin_password < /tmp/adm.txt --admin_email=ok@ok.com --allow-root
fi
sleep infinity
