#! /bin/bash


if [ $BONUS ]
then
	./tmp/tools/adminer.sh
	./tmp/tools/lld.sh
else
	rm -rf /etc/nginx/sites-enabled/adminer.conf &>/dev/null
	rm -rf /etc/nginx/sites-enabled/${FLASK_URL} &>/dev/null
fi

echo "daemon off;" >> /etc/nginx/nginx.conf

./tmp/tools/nflan.sh
echo "Starting nginx"
exec nginx
#-g 'daemon off;'
