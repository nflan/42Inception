# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install apache2 -y
RUN apt install php -y
RUN apt install php-fpm -y
RUN apt install wget
RUN apt install unzip
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
