#! /bin/bash

<<<<<<< HEAD
while ! mariadb -hmariadb -u${DATABASE_USER} -p${DATABASE_UPASS} "${DATABASE_WP}" &>/dev/null
do
    sleep 1
done

mkdir -p /var/www/html/nflan.42.fr

pushd /var/www/html/nflan.42.fr &> /dev/null

if [ ! -f wp-config.php ]
then
	echo "Configuring Wordpress"
	wp core download --allow-root &> /dev/null
	wp config create --dbname=${DATABASE_WP} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_UPASS} --dbhost=${DATABASE} --allow-root &> /dev/null
	chmod 644 wp-config.php
	wp core install --url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} --title=${WORDPRESS_WEBSITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --allow-root &> /dev/null
	wp user create ${WP_USER2} ${WP_UEMAIL2} --user_pass=${WP_UPASS2} --role=editor --allow-root &> /dev/null
fi

chown -R www-data:www-data /var/www/html

if [ $BONUS ]
then
	echo "Configuring Redis"
	wp plugin install redis-cache --activate --allow-root &> /dev/null
	sed -i "s/<?php/<?php\ndefine( 'WP_REDIS_CLIENT', 'phpredis' );\ndefine( 'WP_REDIS_HOST', 'redis');\ndefine( 'WP_REDIS_PORT', 6379 );\ndefine( 'WP_REDIS_PASSWORD', '${REDIS_PASSWORD}');\ndefine( 'WP_REDIS_DATABASE', 0 );\n/g" /var/www/html/nflan.42.fr/wp-config.php &> /dev/null
	wp redis enable --allow-root &> /dev/null
else
	wp plugin deactivate redis-cache --uninstall --allow-root &> /dev/null
	rm -rf /var/www/adminer;\
	rm -rf /var/www/lld;
fi

echo "Starting php-fpm for wordpress"
exec /usr/sbin/php-fpm7.4 -F
=======
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
>>>>>>> a681295 (Starting wordpress and get dependances)
