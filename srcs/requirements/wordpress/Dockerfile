# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install mariadb-client -y
RUN apt install lsb-release -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install wget -y
RUN apt install tar -y
RUN apt install curl -y
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
