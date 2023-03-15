# syntax=docker/dockerfile:1
FROM debian:buster

RUN apt update && apt -y full-upgrade; \
	apt-get install --no-install-recommends --no-install-suggests -y proftpd \
	openssl && \
	test /wordpress || mkdir /wordpress &&\
	echo "/bin/false" >> /etc/shells

COPY conf/conf.sh /tmp/conf.sh
COPY conf/proftpd.conf /etc/proftpd/proftpd.conf
COPY conf/Inception.conf /etc/proftpd/conf.d/Inception.conf
COPY conf/tls.conf /etc/proftpd/tls.conf

RUN chmod 0644 /etc/proftpd/proftpd.conf; \
	chmod 0644 /etc/proftpd/conf.d/Inception.conf; \
	chmod 0644 /etc/proftpd/tls.conf; \
	chmod 0777 /tmp/conf.sh

ENTRYPOINT ["/tmp/conf.sh"]
