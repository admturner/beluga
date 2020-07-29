#!/bin/bash

USER_ID=`id -u`
GROUP_ID=`id -g`

if [ ! -f './config/wordpress/Dockerfile' ]; then
	cp './config/wordpress/Dockerfile.template' './config/wordpress/Dockerfile'
	sed -i '' -e "s/\$UID/${USER_ID}/g" './config/wordpress/Dockerfile'
	sed -i '' -e "s/\$GID/${GROUP_ID}/g" './config/wordpress/Dockerfile'
fi

if [ ! -f './.env' ]; then
	cp './config/.env-example' './.env'
fi

docker-compose up --detach

docker exec -ti wordpress /bin/bash -c 'chown -R www-data: /var/www/html'