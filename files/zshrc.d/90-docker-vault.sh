# shellcheck shell=bash
function docker_vault {
docker run \
  --rm \
  -p 8200:8200 \
  vault
}
