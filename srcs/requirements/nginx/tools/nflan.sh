#! bin/bash

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/wpkey.pem -out /etc/ssl/certs/wpcert.crt -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=${COMPOSE_PROJECT_NAME}/CN=${WORDPRESS_URL}" &> /dev/null

if [ ! -f /etc/nginx/sites-available/nflan.conf ]
then
cat << EOF > /etc/nginx/sites-available/nflan.conf
server {
  listen 80;
  listen [::]:80;
  server_name nflan.42.fr;

  return 404;
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name nflan.42.fr;
    
	ssl_certificate /etc/ssl/certs/wpcert.crt;
	ssl_certificate_key /etc/ssl/private/wpkey.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

    access_log /var/log/nginx/data-access.log combined;

        ## Your only path reference.
        root /var/www/html/nflan.42.fr/;
        ## This should be in your http block and if it is, it's not needed here.
        index index.php;

        ##location = /favicon.ico {
        ##        log_not_found off;
        ##        access_log off;
        ##}

        location = /robots.txt {
                allow all;
                log_not_found off;
                access_log off;
        }

        location / {
                # This is cool because no php is touched for static content.
                try_files \$uri \$uri/ /index.php?\$args;
        }

        location ~ \.php$ {
                try_files \$uri =404;
                fastcgi_intercept_errors on;
                fastcgi_pass wordpress:9000; #nom du conteneur, donc wp et 9000 port standart php fpm
		fastcgi_index index.php;
                #The following parameter can be also included in fastcgi_params file
		include fastcgi_params;
                fastcgi_param  SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }

        location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
                expires max;
                log_not_found off;
        }
}
EOF
ln -s /etc/nginx/sites-available/nflan.conf /etc/nginx/sites-enabled/nflan.conf &> /dev/null
fi

exit 0
