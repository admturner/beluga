#!/bin/bash

echo -e '\nWARNING: This will destroy all of your images and containers, whether
up or down. You cannot restore them.\n'
while read -r -p 'Destroy all images and containers? [y/n] ' input; do
  case "${input}" in
    [yY])
      echo -e 'Destroying...\n'
      docker-compose down --volumes
      docker rm $(docker ps -a -q)
      docker rmi $(docker images -q) --force
      break
      ;;
    [nN])
      echo 'Exiting...'
      exit 0
      break
      ;;
    *)
      echo 'Please select either y or n.'
      exit 1
      ;;
  esac
done
