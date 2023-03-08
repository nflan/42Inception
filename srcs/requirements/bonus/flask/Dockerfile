# syntax=docker/dockerfile:1
FROM debian:buster

RUN	apt update && apt -y full-upgrade; \
	apt-get install -y python3.7 \
	python3-pip python3.7-dev \
	libffi-dev gcc musl-dev make libevent-dev \
	python-gevent python-markupsafe; \
	pip3 install setuptools; \
	pip3 install flask gunicorn; \
	pip3 install --upgrade markupsafe gevent

COPY	conf/conf.sh /tmp/conf.sh
COPY	tools/ /tmp/tools/lld
WORKDIR	/var/www/html

ENTRYPOINT	["/tmp/conf.sh"]
