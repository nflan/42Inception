# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update && apt -y full-upgrade
RUN apt install mariadb-client -y
RUN apt install curl -y
RUN apt install wget -y
RUN apt -y install lsb-release apt-transport-https ca-certificates 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt -y full-upgrade
RUN apt install php7.4 -y
RUN apt-get install php7.4-fpm -y
RUN apt-get install php7.4-common php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-zip php7.4-cli php7.4-json php7.4-pdo php7.4-mbstring php7.4-curl php7.4-xml php7.4-imagick php7.4-tidy php7.4-xmlrpc php7.4-dev php7.4-imap php7.4-opcache -y
RUN \ 
curl -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php && \
mkdir -p /var/www/html/ && \
mv ./adminer-4.8.1.php /var/www/html/ && \
adduser -u 82 -D -S -G www-data www-data
#RUN apt install apache2 -y
#RUN apt install adminer -y
#RUN ./usr/share/adminer/compile.php
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
