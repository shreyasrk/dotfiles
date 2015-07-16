#!/bin/sh

# Load Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Load the necessary .vim bundles
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree/
git clone https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8/
git clone https://github.com/jelera/vim-javascript-syntax.git ~/.vim/bundle/vim-javascript-syntax/
git clone https://github.com/walm/jshint.vim.git ~/.vim/bundle/jshint/	
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive/

# Copy the required .vimrc file
curl -LSSo ~/.vimrc https://raw.githubusercontent.com/shreyasrk/dotfiles/master/.vimrc
