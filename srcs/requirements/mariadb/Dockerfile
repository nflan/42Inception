# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update
RUN apt install -y mariadb-server
<<<<<<< HEAD
=======
RUN test -d '/var/run/mysqld/' || mkdir '/var/run/mysqld' && chmod 777 '/var/run/mysqld' && touch '/var/run/mysqld/mysqld.sock' && chmod 777 '/var/run/mysqld/mysqld.sock' && chown mysql:mysql '/var/run/mysqld/' -R
>>>>>>> a681295 (Starting wordpress and get dependances)
COPY conf/conf.sh /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
