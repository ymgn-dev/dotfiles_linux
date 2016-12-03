"##########################
"####### dein関連 #########
"##########################

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"#######################
"##### python3関連 #####
"#######################

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

" Ctrl-iで自動整形(pep8準拠)
function! Preserve(command)
  " Save the last search.
  let search = @/
  " Save the current cursor position.
  let cursor_position = getpos('.')
  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)
  " Execute the command.
  execute a:command
  " Restore the last search.
  let @/ = search
  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt
  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

function! Autopep8()
  call Preserve(':silent %!autopep8 -')
endfunction

autocmd FileType python nnoremap <C-i> :call Autopep8()<CR>


"############################
"##########基本設定##########
"############################

"文字コード
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"OSのクリップボードを使う
set clipboard=unnamed,unnamedplus

"行数表示
set number

"行番号の色
highlight LineNr ctermfg=darkyellow

"tabのインデント幅
set tabstop=2

"自動で挿入されるインデント幅
set shiftwidth=2

"タブ入力を複数の空白入力に置き換える
set expandtab

"ファイルごとにインデント設定ファイルを開く
filetype indent on

"対応する括弧を強調
set showmatch

":の履歴を保存
set history=500
"行頭、行末でカーソルを止めない
set whichwrap=b,s,h,l,<,>,[,]

"Alt-xでコード整形
function! s:format_file()
  let view = winsaveview()
  normal gg=G
  silent call winrestview(view)
endfunction
nnoremap <A-x> :call <SID>format_file()<CR>


"9で行頭にカーソル移動
nnoremap 9 0

"0で行末にカーソル移動
nnoremap 0 $

"rでRedo
nnoremap r <C-r>

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

"入力中のコマンドを表示
set showcmd

"バックアップファイルを作らない
set nobackup

"スワップファイルを作らない
set noswapfile

"文字列検索に大文字小文字の区別を無効
set ignorecase
set smartcase

" 最後のカーソル位置を復元する
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

"Yで行をヤンク
nnoremap Y y$

"削除時にヤンクしない
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D<Paste>

"色付けon
syntax on

"256色使用
set t_Co=256
