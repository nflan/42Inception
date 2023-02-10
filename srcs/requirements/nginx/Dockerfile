# syntax=docker/dockerfile:1
FROM debian:buster
COPY . nginx/nginx.conf
RUN echo "oui"
EXPOSE	443/tcp
VOLUME /home/nflan/data
USER nflan
#WORKDIR	/tools
#RUN apt install -r ./tools/requirements.txt
