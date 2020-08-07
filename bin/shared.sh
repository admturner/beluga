#!/bin/bash

export YELLOW="\033[38;5;3m"
export GREEN="\033[38;5;2m"
export RED="\033[38;5;9m"
export RESET="\033[0m"
export BOLD="\033[1m"

#######################################
# Displays the currently installed versions.
# Arguments
#   None
# Outputs:
#   The Beluga, Docker Compose, and Docker version numbers
#######################################
version() {
  echo "Beluga version $(cat ./version)"
  docker-compose -v
  docker -v
}
export -f version

#######################################
# Displays the current Beluga and Docker status.
# Arguments
#   None
# Outputs:
#   The Beluga config and Docker container statuses
#######################################
status() {
  local dockerfile_status
  local env_status

  dockerfile_status='not created'
  if [[ -f './config/containers/Dockerfile' ]]; then
    dockerfile_status="${GREEN}created${RESET}"
  fi

  env_status='not created'
  if [[ -f './.env' ]]; then
    env_status="${GREEN}created${RESET}"
  fi

  echo -e "\nBeluga WordPress Dockerfile: ${dockerfile_status}"
  echo -e "Beluga Docker .env file:     ${env_status}\n"

  if [[ -f './.env' ]]; then
    echo -e 'Docker containers:\n'
    docker-compose ps --all
  else
    echo 'Run start command to create Docker containers.'
  fi
}
export -f status
