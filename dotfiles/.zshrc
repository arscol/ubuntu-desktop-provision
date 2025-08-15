export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git thefuck zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias v='vim'
alias z='zellij'
alias lg='lazygit'
