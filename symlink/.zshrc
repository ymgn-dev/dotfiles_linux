# $HOME/.zshファイル読み込み
# 参考: https://qiita.com/Suzuki09/items/80fbf9c6fcffa5c6b6b4
ZSH_HOME="$HOME/.zsh"
if [ -d $ZSH_HOME -a -r $ZSH_HOME -a \
     -x $ZSH_HOME ]; then
    for i in $ZSH_HOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# starship読み込み
eval "$(starship init zsh)"