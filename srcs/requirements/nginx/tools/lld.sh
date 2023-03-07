#! bin/bash

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=nflan/CN=lld.fr"

if [ ! -f /etc/nginx/sites-available/lld.conf ]
then
mkdir /var/www/html/lld &> /dev/null
mv /tmp/index.html /var/www/html/lld &> /dev/null
mv /tmp/lld.css /var/www/html/lld &> /dev/null
cat << EOF > "/etc/nginx/sites-available/lld.conf"
server {
  listen 80;
  server_name lld.fr;

  return 301 https://\$host\$request_uri;
}

server {
  listen 443 ssl;
  server_name lld.fr;
    
	ssl_certificate /etc/ssl/certs/cert.pem;
	ssl_certificate_key /etc/ssl/private/key.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

    access_log /var/log/nginx/data-access.log combined;

        ## Your only path reference.
        root /var/www/html/lld/;
        ## This should be in your http block and if it is, it's not needed here.
        index index.html;

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
                try_files \$uri \$uri/ /index.php?\$args;
        }

        location ~ \.php$ {
                try_files \$uri =404;
                fastcgi_intercept_errors on;
                fastcgi_pass lld:9000;
		fastcgi_index index.html;
                #The following parameter can be also included in fastcgi_params file
		include fastcgi_params;
                fastcgi_param  SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }

}
EOF
ln -s /etc/nginx/sites-available/lld.conf /etc/nginx/sites-enabled/lld.conf &> /dev/null
fi

exit 0
