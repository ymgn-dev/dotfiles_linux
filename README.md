# dotfiles


## Requirements
This dotfiles requires Neovim with ```if_python3```.  
if ```:echo has('python3')``` returns ```1```, then you have python3 support; otherwise, see below.  
You can enable Python3 interface with pip:  
```pip3 install neovim```  

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
