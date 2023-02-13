# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install -y mariadb-server
RUN apt install -y gnupg
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
