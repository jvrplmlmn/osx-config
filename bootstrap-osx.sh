#!/usr/bin/env bash

# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
hash brew &> /dev/null
if [ $? -eq 1 ]; then
  echo "brew not present, installing..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "brew already installed"
fi

# Disable Brew analytics (it is opt-out)
brew analytics off

# homebrew-cask: https://github.com/caskroom/homebrew-cask
brew cask

# homebrew-services: https://github.com/Homebrew/homebrew-services
# Integrates Homebrew formulae with macOS's launchctl manager.
brew tap homebrew/services
