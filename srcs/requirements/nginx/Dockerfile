# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install nginx -y
COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN apt install openssl -y
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
#WORKDIR	/tools
