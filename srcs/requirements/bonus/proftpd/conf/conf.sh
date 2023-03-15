#! /bin/bash

until test -f /wordpress/nflan.42.fr/wp-config.php; do
	sleep 1
done

if [ ! -f /etc/ssl/private/proftpd.key ]
then
	#openssl genrsa -out /etc/ssl/private/proftpd.key 1024
	openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=${COMPOSE_PROJECT_NAME}/CN=ftp.${WORDPRESS_URL}" &> /dev/null
	useradd ${FTP_USER}
	echo "${FTP_PASS}" | ftpasswd --stdin --passwd --file /etc/proftpd/ftpd.passwd --gid 33 --uid 33 --shell /bin/false --name "${FTP_USER}" --home /wordpress/nflan.42.fr &> /dev/null
	ftpasswd --group --name="${FTP_USER}" --file=/etc/proftpd/ftpd.group --gid=33 --member "${FTP_USER}" &> /dev/null
	sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/proftpd.conf" &> /dev/null
	sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/conf.d/Inception.conf" &> /dev/null

	sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/proftpd.conf" &> /dev/null
	sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/conf.d/Inception.conf" &> /dev/null
fi

echo "starting proftpd"
exec proftpd -n -q &> /dev/null
