# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install -y mariadb-server
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
