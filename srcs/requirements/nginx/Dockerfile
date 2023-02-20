# syntax=docker/dockerfile:1
FROM debian:buster
<<<<<<< HEAD
RUN apt update && apt -y full-upgrade
RUN apt install nginx openssl -y

RUN rm -rf /etc/nginx/sites-enabled/default

COPY tools /tmp/tools
COPY conf/nginx.conf /etc/nginx/nginx.conf
=======
RUN apt update
RUN apt install nginx -y
COPY conf/nflan.42.fr.conf /etc/nginx/sites-available/nflan.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
#COPY conf/wordpress.conf /etc/nginx/sites-available/nflan.42.fr.conf
RUN apt install openssl -y
>>>>>>> acda936 (Struggling a bit)
COPY conf/conf.sh /tmp/conf.sh
#COPY conf/nginx.conf /etc/nginx/conf.d/
ENTRYPOINT ["/tmp/conf.sh"]
