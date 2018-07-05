# dotfiles


## Requirements

オッパイソン3.5.2 or higher  

This dotfiles requires Neovim with ```if_python3```.  

if ```:echo has('python3')``` returns ```1```, then you have python3 support; otherwise, see below.  

You can enable Python3 interface with pip:  
```pip<version> install neovim```  

I usually use C ++ and Python.  
If you use dotfiles with Neovim plugins, you may need to execute below commands.  
```
pip<version> install autopep8 flake8 yapf isort
sudo apt install clang-format
sudo apt install clang libclang-dev

# To use vim-airline
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts/
./install.sh
And set Powerline font
```

And you want to enable deoplete-clang, set your libclang path for deoplete-clang in nvim/lazy.toml

For example:  
```
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
```

## Installation

If you link dotfiles with your local bash, inputrc or NeoVim, execute below command.  
```shell
cd dotfiles/
sh link.sh
```

If you want to unlink dotfiles, execute below command.  
```shell
cd dotfiles/
sh unlink.sh
```
