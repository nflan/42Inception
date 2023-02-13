#! /bin/bash

cd /tmp
apt install wget -y
apt install -y lsb-release
wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
dpkg -i mysql-apt-config_0.8.24-1_all.deb
apt update
apt install mysql-server -y
exec mysqld
