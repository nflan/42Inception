# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update && apt -y full-upgrade
RUN apt install mariadb-client -y
RUN apt install redis -y
RUN apt install tar -y
RUN apt install curl -y
RUN apt install wget -y
RUN apt -y install lsb-release apt-transport-https ca-certificates 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt -y full-upgrade
RUN apt install php7.4 -y
RUN apt-get install php7.4-fpm -y
RUN apt-get install php7.4-common php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-zip php7.4-cli php7.4-json php7.4-pdo php7.4-mbstring php7.4-curl php7.4-xml php7.4-imagick php7.4-tidy php7.4-xmlrpc php7.4-dev php7.4-imap php7.4-opcache php7.4-soap -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN apt update && apt -y full-upgrade
RUN test -d '/run/php' || mkdir '/run/php' && chmod 0755 '/run/php' && touch '/run/php/php7.4-fpm.sock' && chmod 0755 '/run/php/php7.4-fpm.sock'
RUN test -d '/var/www/html/nflan.42.fr' || mkdir '/var/www/html/nflan.42.fr' && chmod 0755 '/var/www/html/nflan.42.fr/'
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
