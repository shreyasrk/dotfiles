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

install_oh_my_bash () {
    cd $(pwd)/bash/
    ./setup-bash.sh
}

install_ultimate_badass_bashrc () {
    # cp bash/.bashrc ~/.bashrc
    cp .bashrc-ultimate-badass ~/.bashrc
}

install_bash () {
    # echo "Installing Bash Config..."
    install_ultimate_badass_bashrc
    # echo "Bash Configuration Complete!"
}

# Setup Vim tools
install_vim () {
    # Execute - readlink -f `which vi` - to find vim version. if vim.tiny is found, install vim first!
    echo "Setting up Vim..."
    .$(pwd)/vim/vim-installer.sh
    echo "Vim successfully setup!"
}

# Setup .tmux - Refer to the git repo for more configurations
install_tmux () {
    echo "Setting up tmux..."

    cd
    if cd ~/.tmux; then
        cd ~/.tmux
        git pull;
        cd
    else
        git clone https://github.com/gpakosz/.tmux.git
    fi

    ln -s -f ~/.tmux/.tmux.conf
    cp ~/.tmux/.tmux.conf.local .

    echo "tmux setup complete!"
}

install_asdf_vm () {
    if cd ~/.asdf; then
        git pull;
    else
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
    fi

    echo ". ~/.asdf/asdf.sh" >> ~/.bashrc
    echo ". ~/.asdf/completions/asdf.bash" >> ~/.bashrc
}

install_flatpak_and_brew () {
    # Install flatpak
    echo "Installing flatpak..."

    sudo apt install -y flatpak gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    echo "Flatpak successfully installed! See flatpak.org for usage."

    # Install Brew
    echo "Installing Brew"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    echo "Brew successfully installed! Refer to brew.sh for usage."

    # (Optional) Install podman-desktop (Follow the instructions for your linux distro post that)
    echo "Installing Podman Desktop"
    # flatpak install flathub io.podman_desktop.PodmanDesktop
    brew install podman-desktop

    echo "Podman Desktop successfully installed. Run `apt install -y podman`"
}

# install_bash
install_vim
install_tmux
install_asdf_vm

echo "Setup finish! Enjoy your environment!"
