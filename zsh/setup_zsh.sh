#!/bin/sh

# Run brew update first
brew update --auto-update

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo -e "\n. \"$(brew --prefix asdf)/libexec/asdf.sh\"" >> ~/.bashrc
echo -e "\n. \"$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash\"" >> ~/.bashrc

# Install autoenv
brew install 'autoenv'
printf '%s\n' "source $(brew --prefix autoenv)/activate.sh" >> "${ZDOTDIR:-$HOME}/.zprofile"

# Install ag - the-silver-searcher
brew install the_silver_searcher
