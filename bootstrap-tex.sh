#!/usr/bin/env bash

ME=$(id -un)
TEX_PATH="/usr/local/texlive"
# Assumes that 'stat' is the GNU Coreutils version
TEX_OWNER=$(stat -c '%U' ${TEX_PATH})

if [[ "$TEX_OWNER" -ne "$ME" ]]; then
  echo "Change ownership of TexLive (${TEX_PATH}) to ${ME}, so we can use 'tlmgr'"
  echo "Requires sudo"
  sudo chown -R "${ME}":admin ${TEX_PATH}
fi

# Update LaTex manager
tlmgr update --self

# Install Tex packages
tlmgr install

TEX_PACKAGES=(
  enumitem
  filehook
  fontawesome
  ifmtarg
  lm-math
  sourcesanspro
  ucharcat
  unicode-math
  url
  xifthen
)

for PACKAGE in ${TEX_PACKAGES[*]}
do
  tlmgr install "${PACKAGE}"
done
