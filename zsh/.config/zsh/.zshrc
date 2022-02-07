#!/bin/zsh

unsetopt BEEP

# man zshoptions
setopt AUTOCD EXTENDEDGLOB NOMATCH MENUCOMPLETE
setopt INTERACTIVE_COMMENTS

autoload -Uz colors && colors

source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-prompt"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"


zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "agkozak/zsh-z"

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
# bind keys for iTerm
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Navigate previous item with Shift + Tab
bindkey '^[[Z' reverse-menu-complete

eval "$(pyenv init --path)"

#source $(brew --prefix kube-ps1)/share/kube-ps1.sh
#PROMPT='$(kube_ps1)'$PROMPT

# vim mode

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
