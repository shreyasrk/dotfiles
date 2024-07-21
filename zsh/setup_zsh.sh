#!/bin/sh

# Setup oh-my-zsh!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.ohmyzsh.backup
cp .zshrc ~/

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
