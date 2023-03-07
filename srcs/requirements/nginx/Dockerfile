# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install nginx -y
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/adminer.sh /tmp/tools/adminer.sh
COPY tools/index.html /tmp/index.html
COPY tools/lld.css /tmp/lld.css
COPY tools/lld.sh /tmp/tools/lld.sh
COPY tools/nflan.sh /tmp/tools/nflan.sh
RUN apt install openssl -y
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
