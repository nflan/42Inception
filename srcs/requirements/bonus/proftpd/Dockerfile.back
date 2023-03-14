# syntax=docker/dockerfile:1
FROM debian:buster

RUN	apt update && apt -y full-upgrade; \
	apt install -y vsftpd

COPY	conf/conf.sh /tmp/conf.sh

ENTRYPOINT	["/tmp/conf.sh"]
