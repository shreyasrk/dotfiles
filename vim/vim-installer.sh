#!/bin/sh

# Load Vim-Plug
mkdir -p ~/.vim/autoload && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Load the plugins
cp plugins.vim ~/.vim

# Copy the required .vimrc file
curl -LSSo ~/.vimrc https://raw.githubusercontent.com/shreyasrk/dotfiles/master/vim/.vimrc
