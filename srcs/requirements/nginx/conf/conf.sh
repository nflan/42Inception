#! /bin/bash

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=nflan/CN=nflan.42.fr"

if [ $BONUS ]
then
	./tmp/tools/adminer.sh
else
	rm -rf /etc/nginx/sites-enabled/adminer.conf &>/dev/null
fi

./tmp/tools/nflan.sh
rm -rf /etc/nginx/sites-enabled/default
echo "Starting nginx"
exec nginx -g 'daemon off;'
