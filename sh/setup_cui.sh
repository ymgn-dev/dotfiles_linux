#!/bin/sh

# Tree
sudo apt install -y tree

# Hack Nerd Font
git clone git@github.com:ryanoasis/nerd-fonts.git
cd nerd-fonts && chmod +x install.sh
./install.sh Hack
cd ../
rm -rf nerd-fonts

# Zsh
sudo apt install -y zsh
chsh -s $(which zsh)

# Starship
curl -sS https://starship.rs/install.sh | sh

# Python3 Venv
sudo apt install python3.10-venv
