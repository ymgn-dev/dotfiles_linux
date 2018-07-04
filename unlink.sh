#!/bin/sh

sudo unlink ${HOME}/.bashrc
echo ".bashrc unlinked"

sudo unlink /etc/inputrc
echo "inputrc unlinked"

# Neovim Installing Check !
if [ -e "${HOME}/.config/nvim" ]; then
    sudo unlink ${HOME}/.config/nvim
    echo "nvim found. unlinked!"
else
    echo "nvim not found."
fi

# Vim Installing Check !
# if [ -e "${HOME}/.vim" ]; then
#     sudo unlink ${HOME}/.vim
#     sudo unlink ${HOME}/.vimrc
#     echo "Vim found. unlinked !"
# else
#     echo "nvim not found."
# fi
