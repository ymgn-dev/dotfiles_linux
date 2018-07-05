# dotfiles


## 必要なパッケージやライブラリ

-オッパイソン3.5.2以上  

-Python3を有効にしたNeovim  

Neovimを起動してノーマルモードで```:echo has('python3')```と入力し、1が返ってくればPython3は有効になっています。  
1が返ってこなかった場合、下記のコマンドを実行してください。  

```pip3 install neovim```

dotfiles/nvim/lazy.toml中のC++とPythonのプラグインを使用したければ、下記のコマンドを実行する必要があるかも知れません。  

```
pip3 install autopep8 flake8 yapf isort
sudo apt install clang-format
sudo apt install clang libclang-dev

# vim-airlineを有効にするために
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts/
./install.sh
この操作の後、端末のフォントをPowerline font(この文字が含まれるものならどれでも可)に設定してください。
```

C++の補完プラグインであるdeoplete-clangを有効にしたい場合、nvim/lazy.toml中のdeoplete-clangの設定欄に、  
libclangのパスを設定してください。  

例(Ubuntu18.04):  
```
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
```
libclangはUvuntu16.04を使用している場合、バージョンが 3.8がインストールされる可能性があります。  
その場合は、下記のように設定してください。  
```
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'
```

## インストール

dotfiles中のnvimディレクトリーや.bashrc等のシンボリックリンクをローカルに置く場合、下記のコマンドを実行してください。  
```shell
cd dotfiles/
sh link.sh
```
この操作の完了後、Neovimを起動するとプラグインのインストールが始まります。  
プラグインのインストール完了後、下記のコマンドを実行してください。  
```:UpdateRemotePlugins```

link.shで貼ったシンボリックリンクを削除する場合、下記のコマンドを実行してください。  
```shell
cd dotfiles/
sh unlink.sh
```

<br><br><br>
# English README is here


## Requirements

Python3.5.2 or higher  

dotfiles requires Neovim with ```if_python3```.  

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

If you link dotfiles with your local .bashrc, inputrc or NeoVim, execute below command.  
```shell
cd dotfiles/
sh link.sh
```

If you want to unlink dotfiles, execute below command.  
```shell
cd dotfiles/
sh unlink.sh
```
