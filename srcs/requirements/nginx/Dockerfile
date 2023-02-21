# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install nginx -y
COPY conf/nflan.42.fr.conf /etc/nginx/sites-available/nflan.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN apt install openssl -y
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
