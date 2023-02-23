# syntax=docker/dockerfile:1
FROM debian:buster
RUN apt update && apt -y full-upgrade
#RUN apt install cadvisor -y
COPY conf/conf.sh /tmp/conf.sh
RUN chmod 0777 /tmp/conf.sh
ENTRYPOINT ["/tmp/conf.sh"]
