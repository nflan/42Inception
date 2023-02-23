#! /bin/bash

test -d '/var/www/html/adminer' || mkdir '/var/www/html/adminer' && chmod 0755 '/var/www/html/adminer'
cd '/var/www/html/adminer' && test -f 'adminer.php' || wget -O adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
cd '/var/www/html/adminer'; chmod 0755 adminer.php
chown -R www-data:www-data /var/www/html/adminer/adminer.php
echo "Starting php-fpm for Adminer"
exec php-fpm7.4 -F
