#!/bin/sh

# Install Oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Backup the provided .bashrc to suit ours
mv ~/.bashrc ~/.bashrc.ohmybash.backup

# Copy the custom bashrc to home
cp .bashrc ~/
