# syntax=docker/dockerfile:1
FROM debian:buster

RUN	apt update && apt -y full-upgrade; \
	apt install -y pure-ftpd pure-ftpd-mysql

COPY	conf/conf.sh /tmp/conf.sh
ENTRYPOINT	["/tmp/conf.sh"]
