#! /bin/bash

#mv /usr/share/adminer/adminer-*.php /usr/share/adminer/adminer.php &> /dev/null
#echo "Alias /adminer.php /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf
#a2enconf adminer.conf
#service apache2 reload # -server_name="wordpress"
#exec php -S 127.0.0.2:8000 -t /usr/share/adminer/
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
exec sleep infinity
