#! /bin/bash

until test -f /wordpress/nflan.42.fr/wp-config.php; do
	sleep 1
done
echo "end of sleep"
if [ ! -f /etc/ssl/private/proftpd.key ]
then
openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=nflan/CN=ftp.nflan.42.fr"
useradd ${FTP_USER}
echo "${FTP_PASS}" | ftpasswd --stdin --passwd --file /etc/proftpd/ftpd.passwd --gid 33 --uid 33 --shell /bin/false --name "${FTP_USER}" --home /wordpress/nflan.42.fr
ftpasswd --group --name="${FTP_USER}" --file=/etc/proftpd/ftpd.group --gid=33 --member "${FTP_USER}"
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/conf.d/Inception.conf"

sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/conf.d/Inception.conf"
fi
echo "starting proftpd"
exec proftpd -n -q
