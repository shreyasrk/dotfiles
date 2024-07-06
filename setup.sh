#!/bin/sh

# The dotfiles
# Primarily, the tools without which I cannot access the terminal, lol.
# I use tmux, bash, git and vim a lot. Most of the configurations are for these.
# VSCode might be next - yet to explore them
# Setup all variables for my environment to run

# Copy all Git configurations
echo "Setting up Git..."
cp .gitignore ~/.gitignore
cp .gitconfig ~/.gitconfig
echo "Git configuration Complete!"

# Move all .bash config
echo "Installing Bash Config..."
# cp bash/.bashrc ~/.bashrc
cp .bashrc ~/.bashrc
echo "Bash Configuration Complete!"

# Setup Vim tools
echo "Setting up Vim..."
./vim/vim-installer.sh
echo "Vim successfully setup!"

# Setup .tmux - Refer to the git repo for more configurations
echo "Setting up tmux..."
cd ~
if cd .tmux; then
    git pull;
else
    git clone https://github.com/gpakosz/.tmux.git
fi
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/
echo "tmux setup complete!"

echo "Setup finish! Enjoy your environment!"
