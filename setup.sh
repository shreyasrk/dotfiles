#!/bin/sh

# Setup all variables for my environment to run

# Move all Git configurations
cp .gitignore ~/.gitignore
cp .gitconfig ~/.gitconfig

# Move all .bash config
cp bash/.bashrc ~/.bashrc
cp bash/bashrc_jiva ~/.bashrc_jiva

# Setup Vim tools
./vim/vim-installer.sh
