#! /bin/bash

service vsftpd start
useradd wordpress
adduser wordpress www-data
echo wordpress:nflan42 | chpasswd
mkdir -p /var/ftp/wordpress
mount --bind /var/www/html /var/ftp/wordpress
usermod -d /var/ftp/wordpress wordpress
ufw allow 21/tcp
ufw enable
service vsftpd stop
service vsftpd start
echo "vsftpd"
exec sleep infinity
