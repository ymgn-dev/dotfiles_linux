#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

sudo ln -sf $SCRIPT_DIR/.bashrc ${HOME}/.bashrc
sudo ln -sf $SCRIPT_DIR/inputrc /etc/inputrc

# Neovim Installing Check
if type nvim 2>/dev/null 1>/dev/null
then
	echo "nvim found !"
	ln -sf $SCRIPT_DIR/dotfiles/nvim/ ${HOME}/.config/nvim
else
	echo "nvim not found !"
fi

# Vim Installing Check
if type vim 2>/dev/null 1>/dev/null
then
	echo "vim found !"
	sudo ln -sf $SCRIPT_DIR/.vimrc ${HOME}/.vimrc
	ln -sf $SCRIPT_DIR/dotfiles/.vim/ ${HOME}/.vim
else
	echo "vim not found !"
fi
