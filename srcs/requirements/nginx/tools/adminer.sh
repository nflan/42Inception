#! bin/bash

if [ ! -f /etc/nginx/sites-available/adminer.conf ]
then
cat << EOF > "/etc/nginx/sites-available/adminer.conf"
server {
  listen 80;
  server_name adminer.fr;

  return 301 https://\$host\$request_uri;
}

server {
  listen 443 ssl;
  server_name adminer.fr;
    
	ssl_certificate /etc/ssl/certs/cert.pem;
	ssl_certificate_key /etc/ssl/private/key.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

    access_log /var/log/nginx/data-access.log combined;

        ## Your only path reference.
        root /var/www/html/adminer/;
        ## This should be in your http block and if it is, it's not needed here.
        index adminer.php;

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
                fastcgi_pass adminer:9000;
		fastcgi_index index.php;
                #The following parameter can be also included in fastcgi_params file
		include fastcgi_params;
                fastcgi_param  SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }

}
EOF
ln -s /etc/nginx/sites-available/adminer.conf /etc/nginx/sites-enabled/adminer.conf &> /dev/null
fi

exit 0
