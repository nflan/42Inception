# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt-get update && \
RUN apt-get install --no-install-recommends --no-install-suggests -y redis-server
RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf; \ 
	echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf; \
	sed -i "s/appendonly no/appendonly yes/" /etc/redis/redis.conf; \
	sed -i "s/bind 127.0.0.1 ::1/#bind 127.0.0.1 ::1/g" /etc/redis/redis.conf; \
	sed -i "s/dir .\//dir \/var\/lib\/redis/g" /etc/redis/redis.conf; \
	test -d /var/lib/redis || mkdir /var/lib/redis;
COPY conf/conf.sh /conf.sh
RUN chmod 0777 /conf.sh
ENTRYPOINT ["/conf.sh"]
