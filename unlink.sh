#!/bin/sh
unlink ${HOME}/.bashrc
unlink /etc/inputrc

# Neovim Installing Check !
if [ -e "${HOME}/.config/nvim" ]; then
    echo "nvim found. unlinked !"
    unlink ${HOME}/.config/nvim
else
    echo "nvim not found."
fi

# Vim Installing Check !
if [ -e "${HOME}/.vim" ]; then
    echo "Vim found. unlinked !"
    unlink ${HOME}/.vim
    unlink ${HOME}/.vimrc
else
    echo "nvim not found."
fi
