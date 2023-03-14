# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install nginx -y
RUN apt install openssl -y

RUN rm -rf /etc/nginx/sites-enabled/default

#COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools /tmp/tools
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
