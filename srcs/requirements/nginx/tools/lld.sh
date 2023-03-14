#! bin/bash

openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/lldkey.pem -out /etc/ssl/certs/lldcert.crt -sha256 -days 365 -nodes -subj "/C=FR/ST=France/L=Paris/O=42/OU=${COMPOSE_PROJECT_NAME}/CN=${FLASK_URL}"

if [ ! -f /etc/nginx/sites-available/${FLASK_URL} ]
then
cat << EOF > "/etc/nginx/sites-available/${FLASK_URL}"
server {
  listen 80;
  listen [::]:80 ssl;
  server_name ${FLASK_URL};

  return 301 https://\$host\$request_uri;
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name ${FLASK_URL};
    
	ssl_certificate /etc/ssl/certs/lldcert.crt;
	ssl_certificate_key /etc/ssl/private/lldkey.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

        root /var/www/html/lld/;

        location / {
		include proxy_params;
		proxy_pass http://flask:5000;
                try_files \$uri \$uri/ /index.php?\$args;
        }


}
EOF
ln -s /etc/nginx/sites-available/${FLASK_URL} /etc/nginx/sites-enabled/${FLASK_URL} &> /dev/null
fi

exit 0
