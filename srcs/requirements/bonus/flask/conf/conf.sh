#! /bin/bash

rm -fr lld/
cp -R /tmp/tools/lld .
chown -R www-data:www-data lld
find lld -type d -print0 | xargs -0 chmod 755
find lld -type f -print0 | xargs -0 chmod 644
exec gunicorn --chdir lld --pid 1 --bin 0.0.0.0:5000 --name "${FLASK_APP_NAME}" --timeout 60 --workers 3 --worker-class gevent lld:app
