#! /bin/bash

#apt update
mkdir -p /var/www/html/nflan.42.fr
pushd /var/www/html/nflan.42.fr
#wget https://wordpress.org/latest.tar.gz
#tar -xvzf latest.tar.gz
#chown -R www-data:www-data /var/www/html/nflan.42.fr/
if [ ! -f wp-config.php ]
then
	apt-get install php7.4-{common,bcmath,bz2,intl,gd,mbstring,mysql,zip,cli,fpm,json,pdo,mbstring,curl,xml,imagick,tidy,xmlrpc,dev,imap,opcache,soap} -y
	wp core download --allow-root
	wp config create --dbname=wordpress --dbuser=nflan42 --dbpass=nflan42 --dbhost=mariadb --allow-root
	chmod 644 wp-config.php
	wp core install --url=nflan.42.fr --title=Inception --admin_user=supervisor --prompt=admin_password < /tmp/adm.txt --admin_email=ok@ok.com --allow-root
	cd wp-content && chmod 775 uploads
	sed 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf > /tmp/www.conf
	mv /tmp/www.conf /etc/php/7.4/fpm/pool.d/www.conf

fi
sleep infinity
