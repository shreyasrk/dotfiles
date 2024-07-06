#!/bin/sh

# the vim-plug way - feel free to uncomment to use it - although I've moved on..
# Load Vim-Plug
# mkdir -p ~/.vim/autoload && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Load the plugins
# cp plugins.vim ~/.vim

# Copy the required .vimrc file
# curl -LSSo ~/.vimrc https://raw.githubusercontent.com/shreyasrk/dotfiles/master/vim/.vimrc

# Using a newer, better version - https://github.com/amix/vimrc?tab=readme-ov-file
# The leader is "," so whenever you see <leader> it means ,
if [ -d ~/.vim_runtime ]; then
    git pull
else
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
fi
sh ~/.vim_runtime/install_awesome_vimrc.sh

# install plugins without any plugin manager
# mkdir -p ~/.vim_runtime/pack/plugins/start

# Clone the plugin that you want in that directory. Refer to vim pack for usage. For example -
# git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go

# Still better - use vim-jetpack - https://github.com/tani/vim-jetpack - To give auto plugin management experience like vim-plug
if [ ! -d ~/.vim/pack/jetpack ]; then
    curl -fLo ~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
fi

# Add all your custom vim configurations here to maintain sanity
cp $(pwd)/vim/my_configs.vim ~/.vim_runtime
