# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install -y mariadb-server
#RUN test -d '/var/run/mysqld/' || mkdir '/var/run/mysqld' && chmod 0755 '/var/run/mysqld' && touch '/var/run/mysqld/mysqld.sock' && chmod 0755 '/var/run/mysqld/mysqld.sock' && chown mysql:mysql '/var/run/mysqld/' -R
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
