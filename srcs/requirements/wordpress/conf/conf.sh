#! /bin/bash

while ! mariadb -hmariadb -u${DATABASE_USER} -p${DATABASE_UPASS} "${DATABASE_WP}" &>/dev/null
do
    sleep 1
done

mkdir -p /var/www/html/nflan.42.fr

pushd /var/www/html/nflan.42.fr &> /dev/null

if [ ! -f wp-config.php ]

then
	wp core download --allow-root
	wp config create --dbname=${DATABASE_WP} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_UPASS} --dbhost=${DATABASE} --allow-root
	chmod 644 wp-config.php
	wp core install --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} --title=${WORDPRESS_WEBSITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --allow-root
	wp user create ${WP_USER2} ${WP_UEMAIL2} --user_pass=${WP_UPASS2} --allow-root
#	sed -i "s/<?php/<?php\ndefine( 'WP_REDIS_CLIENT', 'phpredis' );\ndefine( 'WP_REDIS_HOST', 'redis');\ndefine( 'WP_REDIS_PORT', 6378 );\ndefine( 'WP_REDIS_PASSWORD', '${REDIS_PASSWORD}');\ndefine( 'WP_REDIS_DATABASE', 0 );\n/" "wp-config.php";
fi

chown -R www-data:www-data /var/www/html

if [ $BONUS ]
then
	cd /var/www/html/nflan.42.fr;\
	wp plugin install redis-cache --activate --allow-root &> /dev/null;\
	sed -i "s/<?php/<?php\ndefine( 'WP_REDIS_CLIENT', 'phpredis' );\ndefine( 'WP_REDIS_HOST', 'redis');\ndefine( 'WP_REDIS_PORT', 6379 );\ndefine( 'WP_REDIS_PASSWORD', '${REDIS_PASSWORD}');\ndefine( 'WP_REDIS_DATABASE', 0 );\n/g" /var/www/html/nflan.42.fr/wp-config.php;
#	sed -i s/"<?php"/"<?php\ndefine('WP_REDIS_HOST','redis');\ndefine( 'WP_REDIS_PASSWORD', '$REDIS_PW' );"/g /var/www/html/wp-config.php ;\
	wp redis enable --allow-root &> /dev/null;
else
	cd /var/www/html/nflan.42.fr;\
	wp plugin deactivate redis-cache --uninstall --allow-root &> /dev/null;\
	cd /var/www/html
	rm -rf adminer;\
	rm -rf lld;
fi

echo "Starting php-fpm"
exec /usr/sbin/php-fpm7.4 -F
