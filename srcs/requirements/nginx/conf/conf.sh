#! /bin/bash

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=nflan/CN=nflan.42.fr"
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/nflan.conf /etc/nginx/sites-enabled/nflan.conf &> /dev/null
echo "Starting nginx"
exec nginx -g 'daemon off;'
