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
	wp config create --dbname=${DATABASE_WP} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_UPASS} --dbhost=${DATABASE} --allow-root
	chmod 644 wp-config.php
	wp core install --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} --title=${WORDPRESS_WEBSITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --allow-root
	wp option update siteurl ${WORDPRESS_WEBSITE_URL} --allow-root
	cd wp-content && chmod 775 uploads
	sed 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf > /tmp/www.conf
	mv /tmp/www.conf /etc/php/7.4/fpm/pool.d/www.conf

fi
sleep infinity
