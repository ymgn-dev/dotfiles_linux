#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo ".bashrc linked"
sudo ln -sf $SCRIPT_DIR/.bashrc ${HOME}/.bashrc

echo "inputrc linked"
sudo ln -sf $SCRIPT_DIR/inputrc /etc/inputrc

# Neovim Installing Check
if type nvim 2>/dev/null 1>/dev/null
then
	echo "nvim found! linked"
	ln -sf $SCRIPT_DIR/nvim/ ${HOME}/.config/nvim
else
	echo "nvim not found!"
fi

# Vim Installing Check
# if type vim 2>/dev/null 1>/dev/null
# then
# 	echo "vim found ! linked"
# 	sudo ln -sf $SCRIPT_DIR/.vimrc ${HOME}/.vimrc
# 	ln -sf $SCRIPT_DIR/vim/ ${HOME}/.vim
# else
# 	echo "vim not found !"
# fi
