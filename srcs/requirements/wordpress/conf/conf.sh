#! /bin/bash

pushd /var/www/html/nflan.42.fr &> /dev/null
chown -R www-data:www-data /var/www/html/nflan.42.fr/
if [ ! -f wp-config.php ]
then
	wp core download --allow-root
	wp config create --dbname=${DATABASE_WP} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_UPASS} --dbhost=${DATABASE} --allow-root
	chmod 644 wp-config.php
	wp core install --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} --title=${WORDPRESS_WEBSITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --allow-root
	wp option update siteurl ${WORDPRESS_WEBSITE_URL} --allow-root
	wp user create ${WP_USER2} ${WP_UEMAIL2} --user_pass=${WP_UPASS2} --allow-root
fi
cd wp-content && chmod 775 uploads
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
echo "Starting php-fpm"
exec php-fpm7.4 -F
