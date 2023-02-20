#! /bin/bash

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=nflan/CN=nflan.42.fr"
ln -s /etc/nginx/sites-available/nflan.conf /etc/nginx/sites-enabled/nflan.conf
nginx -s reload
exec nginx -g 'daemon off;'
