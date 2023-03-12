FROM debian:buster

RUN apt-get update; apt-get install -y curl mariadb-client php-mysql wget; curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; chmod +x wp-cli.phar; mv wp-cli.phar /usr/local/bin/wp
RUN apt update ; apt -y install lsb-release apt-transport-https ca-certificates ; wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list; apt update;
RUN apt update; apt install php7.4-cgi php7.4-mysql php7.4-fpm php7.4-pdo php7.4-gd php7.4-cli -y
RUN mkdir /run/php
RUN sed -i s/"\/run\/php\/php7.4-fpm.sock"/9000/g  /etc/php/7.4/fpm/pool.d/www.conf

COPY /conf/conf.sh /tmp/conf.sh

ENTRYPOINT ["/tmp/conf.sh"]
