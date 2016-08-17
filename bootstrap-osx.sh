#!/usr/bin/env bash

# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
hash brew &> /dev/null
if [ $? -eq 1 ]; then
  echo "brew not present, installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "brew already installed"
fi

