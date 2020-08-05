#!/bin/bash

echo -e '\033[38;5;9m \nWARNING: This will destroy all images and containers, whether up or
down. You cannot restore them.\033[0m\n'

read -r -p 'Remove all images and containers? [y/N] ' input
case "${input}" in
  [yY])
    echo -e 'Destroying...\n'
    docker-compose down --volumes --remove-orphans
    docker rm "$(docker ps -a -q)"
    docker rmi "$(docker images -q)" --force
    ;;
  *)
    echo 'Exiting...'
    exit 0
    ;;
esac
