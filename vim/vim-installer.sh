#!/bin/sh

# Method 1 - Baremetal
install_vim_bm () {
  # install plugins without any plugin manager
  mkdir -p ~/.vim_runtime/pack/plugins/start

  # Clone the plugin that you want in that directory. Refer to vim pack for usage. For example -
  git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
}

# Method 2 - The semi-crude way
install_vim_plug () {
  # Copy the required .vimrc file
  curl -LSSo ~/.vimrc https://raw.githubusercontent.com/shreyasrk/dotfiles/master/vim/.vimrc

  # Load Vim-Plug and install plugins
  mkdir -p ~/.vim/autoload && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  cp $(pwd)/vim/plugins.vim ~/.vim
}

# Method 3 - A newer, better version - https://github.com/amix/vimrc?tab=readme-ov-file
install_vim_runtime () {
  # The leader is "," so whenever you see <leader> it means ,
  if [ -d ~/.vim_runtime ]; then
      git pull
  else
      git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
  fi
  sh ~/.vim_runtime/install_awesome_vimrc.sh

  # Load the plugins into custom folder - vim_runtime will pick this up
  cp $(pwd)/vim/plugins.vim ~/.vim_runtime/my_plugins

  # This contains all my custom configs including installing custom plugins - Make sure this is kept updated at all times!
  # Add all your custom vim configurations here to maintain sanity
  cp $(pwd)/vim/my_configs.vim ~/.vim_runtime
}

install_vim_runtime

