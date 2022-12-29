export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

export EDITOR=vim
export VISUAL=$EDITOR

export LC_TIME=C
export TZ=UTC
export LESSCHARSET=utf-8

export PATH="$HOME/bin:$PATH"

alias k=kubectl

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

PS1="%n@%m %1~ %# "
