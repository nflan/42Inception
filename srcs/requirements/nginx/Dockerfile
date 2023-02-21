# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install nginx -y
COPY conf/nflan.42.fr.conf /etc/nginx/sites-available/nflan.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
#COPY conf/wordpress.conf /etc/nginx/sites-available/nflan.42.fr.conf
RUN apt install openssl -y
COPY conf/conf.sh /tmp/conf.sh
#COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
#COPY conf/nflan.42.fr.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["/tmp/conf.sh"]
