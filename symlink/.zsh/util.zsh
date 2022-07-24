# 履歴ファイルの保存先
HISTFILE=$HOME/.zsh_history

# メモリに保存する最大件数
HISTSIZE=100

# 履歴ファイルに保存する最大件数
SAVEHIST=1000

# 重複を除く
setopt  hist_ignore_all_dups

# 重複したコマンドのうち古い方を削除する
setopt hist_save_no_dups

# HISTFILEのサイズがHISTSIZEを超える場合は最初に重複を除く
setopt hist_expire_dups_first

# カラー表示を有効にする
autoload -Uz colors && colors

# 補完機能を有効にする
autoload -Uz compinit && compinit

# 補完候補の大文字と小文字を区別しない
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# cdなしでディレクトリ移動できるようにする
setopt auto_cd

# ビープ音を消す
setopt no_beep