let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" dein {{{
let s:dein_cache_dir = g:cache_home . '/dein'

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    " dein.vim をプラグインとして読み込む
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home . '/dein'

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
    if has('nvim')
        call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
    endif

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}

"#####################################
"########## Python Settings ##########
"#####################################

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

" Alt-iで自動整形(pep8準拠)
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

autocmd FileType python nnoremap <A-i> :call Autopep8()<CR>

"#######################################
"##############基本設定#################
"#######################################

" 文字コード設定
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

"OSのクリップボードを使う
set clipboard=unnamed,unnamedplus

"行数表示
set number

"行番号の色
highlight LineNr ctermfg=darkyellow

"tabのインデント幅
set tabstop=4

"自動で挿入されるインデント幅
set shiftwidth=4

"タブ入力を複数の空白入力に置き換える
"set expandtab

"ファイルごとにインデント設定ファイルを開く
filetype indent on

"対応する括弧を強調
set showmatch

":の履歴を保存
set history=500
"行頭、行末でカーソルを止めない
"set whichwrap=b,s,h,l,<,>,[,]

"Ctrl-iでコード整形
function! s:format_file()
  let view = winsaveview()
  normal gg=G
  silent call winrestview(view)
endfunction
nnoremap <C-i> :call <SID>format_file()<CR>

" tagsジャンプの時に複数ある時は一覧表示                                        
" F3で候補先を選択してジャンプ, F2で戻る
nnoremap <F3> g<C-]>
nnoremap <F2> <C-t>

"9で行頭にカーソル移動
"nnoremap 9 0

"0で行末にカーソル移動
"nnoremap 0 $

"rでRedo
"nnoremap r <C-r>

" 行末の1文字先までカーソルを移動できるように
"set virtualedit=onemore

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
