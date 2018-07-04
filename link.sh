#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

sudo ln -sf $SCRIPT_DIR/.bashrc ${HOME}/.bashrc
echo ".bashrc linked"

sudo ln -sf $SCRIPT_DIR/inputrc /etc/inputrc
echo "inputrc linked"

# Neovim Installing Check
if type nvim 2>/dev/null 1>/dev/null
then
	ln -sf $SCRIPT_DIR/nvim/ ${HOME}/.config/nvim
	echo "nvim found! linked"
else
	echo "nvim not found!"
fi

# Vim Installing Check
# if type vim 2>/dev/null 1>/dev/null
# then
# 	sudo ln -sf $SCRIPT_DIR/.vimrc ${HOME}/.vimrc
# 	ln -sf $SCRIPT_DIR/vim/ ${HOME}/.vim
# 	echo "vim found ! linked"
# else
# 	echo "vim not found !"
# fi
