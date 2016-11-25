#!/usr/bin/env bash

set -e

PROJECTS_ROOT=${HOME}/Projects
PROJECTS=(
  javier
  golang
  github
  github/ansible
  github/chef
  github/docker
  github/hashicorp
  github/stackstorm
)

for PROJECT in ${PROJECTS[*]}
do
  echo "Creating directory: ${PROJECTS_ROOT}/${PROJECT}"
  mkdir -p ${PROJECTS_ROOT}/${PROJECT}
done
