#! /bin/bash

<<<<<<< HEAD
if [ $BONUS ]
then
	./tmp/tools/adminer.sh
	./tmp/tools/lld.sh
else
	rm -rf /etc/nginx/sites-enabled/adminer.conf &>/dev/null
	rm -rf /etc/nginx/sites-enabled/${FLASK_URL} &>/dev/null
fi

./tmp/tools/nflan.sh

echo "Starting nginx"
exec nginx
=======
openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=nflan/CN=nflan.42.fr"
ln -s /etc/nginx/sites-available/nflan.conf /etc/nginx/sites-enabled/nflan.conf
nginx -s reload
exec nginx -g 'daemon off;'
>>>>>>> acda936 (Struggling a bit)
