#!/bin/sh
sudo unlink ${HOME}/.bashrc
sudo unlink /etc/inputrc

# Neovim Installing Check !
if [ -e "${HOME}/.config/nvim" ]; then
    echo "nvim found. unlinked !"
    sudo unlink ${HOME}/.config/nvim
else
    echo "nvim not found."
fi

# Vim Installing Check !
if [ -e "${HOME}/.vim" ]; then
    echo "Vim found. unlinked !"
    sudo unlink ${HOME}/.vim
    sudo unlink ${HOME}/.vimrc
else
    echo "nvim not found."
fi
