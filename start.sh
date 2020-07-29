#!/bin/bash

USER_ID=`id -u`
GROUP_ID=`id -g`

if [ ! -f './config/containers/Dockerfile' ]; then
	cp './config/containers/Dockerfile.template' './config/containers/Dockerfile'
	sed -i '' -e "s/\$UID/${USER_ID}/g" './config/containers/Dockerfile'
	sed -i '' -e "s/\$GID/${GROUP_ID}/g" './config/containers/Dockerfile'
fi

if [ ! -f './.env' ]; then
	cp './config/.env-example' './.env'
fi

CONTAINERS=wordpress

echo "Starting Docker containers"
docker-compose up --detach $CONTAINERS

docker exec -ti wordpress /bin/bash -c 'chown -R www-data: /var/www/html'

while [ "$READY" != "true" ]; do
	if curl -I http://localhost:8000 2>/dev/null | grep -q -e "HTTP/1.1 200 OK" -e "HTTP:/1.1 302 Found"; then
		READY=true
	else
		sleep 4
		echo "Waiting for WP to boot..."
	fi
done

echo "All set!"