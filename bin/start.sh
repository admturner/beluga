#!/bin/bash

#######################################
# Creates the WP container Dockerfile.
# Arguments
#   None
# Outputs:
#   Creates the Dockerfile and writes RUN commands to it
#######################################
set_up_dockerfile() {
	local user_id
  local group_id

  if ! cp './config/containers/Dockerfile.template' './config/containers/Dockerfile'; then
    echo -e "${YELLOW}× Unable to copy Dockerfile in config.${RESET}" >&2
    exit 1
  else
    echo -e "✔ Copied WordPress container Dockerfile."
  fi

  user_id="$(id -u)"
	group_id="$(id -g)"

  echo -e "\nRUN usermod -u ${user_id} www-data" >> './config/containers/Dockerfile'
  echo -e "RUN groupmod -o -g ${group_id} www-data" >> './config/containers/Dockerfile'
}

#######################################
# Starts the script.
# Arguments:
#   None
#######################################
main() {
  local ready

  echo -e "${RED}      ____                                "
  echo -e "${ORANGE}     /   )          /                     "
  echo -e "${YELLOW} ---/__ /-----__---/-----------__----__-  "
  echo -e "${GREEN}   /    )   /___) /   /   /  /   ) /   )  "
  echo -e "${BLUE} _/____/___(___ _/___(___(__(___/_(___(_  "
  echo -e "${VIOLET}                               /          "
  echo -e "${PINK}                           (_ /           ${RESET}"
  
  version

  echo -e "▷ Running the Beluga startup sequence..."

  exit 0

  if [[ ! -f './config/containers/Dockerfile' ]]; then
    set_up_dockerfile
  fi

  if [ ! -f './.env' ]; then
    cp './config/.env-example' './.env'
  fi

  docker-compose up --detach

  docker exec -ti wordpress /bin/bash -c 'chown -R www-data: /var/www/html'

  while [[ -z "${ready}" ]]; do
    if curl -I http://localhost:8000 2>/dev/null | grep -q -e "HTTP/1.1 200 OK" -e "HTTP/1.1 302 Found"; then
      ready=true
    else
      sleep 4
      echo 'Waiting for network to boot...'
    fi
  done

  echo -e "${GREEN}✔ All set${RESET}"
}

main "$@"
