#!/bin/sh

# Load Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Load the necessary .vim bundles
git clone git@github.com:scrooloose/nerdtree.git ~/.vim/bundle/nerdtree/
git clone git@github.com:nvie/vim-flake8.git ~/.vim/bundle/vim-flake8/
git clone git@github.com:jelera/vim-javascript-syntax.git ~/.vim/bundle/vim-javascript-syntax/
git clone git@github.com:walm/jshint.vim.git ~/.vim/bundle/jshint/	
git clone git@github.com:tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive/

# Copy the required .vimrc file
curl -LSSo ~/.vimrc https://raw.githubusercontent.com/shreyasrk/dotfiles/master/.vimrc
