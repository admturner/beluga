#!/bin/bash

echo -e "${RED} \n!!! WARNING !!! This will destroy all images and
containers, whether up or down. You cannot restore them.${RESET}\n"

read -r -p 'Remove all images and containers? [y/N] ' input
case "${input}" in
  [yY])
    echo -e 'Destroying...\n'
    docker-compose down --volumes --remove-orphans
    # shellcheck disable=SC2046
    docker rm $(docker ps --all --quiet)
    # shellcheck disable=SC2046
    docker rmi $(docker images --quiet) --force
    ;;
  *)
    echo 'Exiting...'
    exit 0
    ;;
esac
