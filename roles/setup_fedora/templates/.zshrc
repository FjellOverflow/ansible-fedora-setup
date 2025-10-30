export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(sudo tmux zsh-autosuggestions zsh-syntax-highlighting k)

source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases" 
fi