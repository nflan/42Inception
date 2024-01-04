# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update && apt -y full-upgrade
RUN apt install nginx openssl -y

RUN rm -rf /etc/nginx/sites-enabled/default

COPY tools /tmp/tools
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
