#! /bin/bash

test -d '/var/www/html/nflan.42.fr' || mkdir '/var/www/html/nflan.42.fr' && chmod 0755 '/var/www/html/nflan.42.fr/'
pushd /var/www/html/nflan.42.fr &> /dev/null
if [ ! -f wp-config.php ]
then
	wp core download --allow-root
	wp config create --dbname=${DATABASE_WP} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_UPASS} --dbhost=${DATABASE} --allow-root
	chmod 644 wp-config.php
	wp core install --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} --title=${WORDPRESS_WEBSITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --allow-root
	wp option update siteurl ${WORDPRESS_WEBSITE_URL} --allow-root
	wp user create ${WP_USER2} ${WP_UEMAIL2} --user_pass=${WP_UPASS2} --allow-root
	sed -i "s/<?php/<?php\ndefine( 'WP_REDIS_CLIENT', 'phpredis' );\ndefine( 'WP_REDIS_HOST', 'redis');\ndefine( 'WP_REDIS_PORT', 6379 );\ndefine( 'WP_REDIS_PASSWORD', '${REDIS_PASSWORD}');\ndefine( 'WP_REDIS_DATABASE', 0 );\n/" "wp-config.php";
fi
cd wp-content && chmod 775 uploads

if [ $BONUS ]
then
	cd /var/www/html/nflan.42.fr &> /dev/null; \
	wp plugin install redis-cache --activate --allow-root 2>/dev/null; \
	wp redis enable --allow-root 2>/dev/null
else
	cd /var/www/html/nflan.42.fr &> /dev/null; \
	wp plugin deactivate redis-cache --uninstall --allow-root 2>/dev/null
fi
chown -R www-data:www-data /var/www/html/nflan.42.fr/
echo "Starting php-fpm for Wordpress"
exec php-fpm7.4 -F
