#!/bin/sh

# Backup the provided .bashrc to suit ours
mv ~/.bashrc ~/.bashrc.ohmybash.backup

# Install Oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
source ~/.bashrc

# Copy the custom bashrc to home
cp .bashrc ~/
