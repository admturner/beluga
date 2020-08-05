#!/bin/bash

echo -e '\nWARNING: This will destroy all images and containers, whether up or
down. You cannot restore them.\n'

read -r -p 'Remove all images and containers? [y/N] ' input
case "${input}" in
  [yY])
    echo -e 'Destroying...\n'
    docker-compose down --volumes --remove-orphans
    docker rm $(docker ps -a -q)
    docker rmi $(docker images -q) --force
    ;;
  *|[nN])
    echo 'Exiting...'
    exit 0
    ;;
esac
