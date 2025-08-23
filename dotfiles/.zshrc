export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="agnoster"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git thefuck)

source $ZSH/oh-my-zsh.sh

alias c='clear'
alias e='exit'
alias q='exit'
alias v='nvim'
alias z='zellij'
alias lg='lazygit'
alias ld='lazydocker'
alias network='nmtui'
alias matrix='unimatrix -n -s 96 -l o'

alias firefox='firefox &'
alias steam='steam &'
alias protonvpn='protonvpn-app &'

export WAYLAND_DISPLAY=wayland-1
export XDG_SESSION_TYPE=wayland
export CLIPBOARD=wl-clipboard
