# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update && apt -y full-upgrade; \
	apt-get install -y redis-server
RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf; \ 
	echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf; \
	sed -i "s/appendonly no/appendonly yes/" /etc/redis/redis.conf; \
	sed -i "s/bind 127.0.0.1 ::1/#bind 127.0.0.1 ::1/g" /etc/redis/redis.conf; \
	sed -i "s/dir .\//dir \/var\/lib\/redis/g" /etc/redis/redis.conf; \
	test -d /var/lib/redis || mkdir /var/lib/redis;
COPY conf/conf.sh /tmp/conf.sh
RUN chmod 0777 /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
