# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB
# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT


autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/.config/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)


source ~/dotfiles/zsh/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# Go development
export GOPATH="${HOME}/dev/"
export GOROOT="$(brew --prefix golang)/libexec"
export GOBIN="${GOPATH}/bin"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GOOGLE_CREDENTIALS="/Users/marcoh/.cfg/devCredentials.json"
# For Go Modules
export GOPRIVATE="nandosuk"
source "$XDG_CONFIG_HOME/zsh/aliases.sh"


source <(kubectl completion zsh)
complete -F __start_kubectl k

# bind keys for iTerm
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

export PATH="$HOME/.cargo/bin:$PATH"
#eval "$(pyenv init --path)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marco.hernandez/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marco.hernandez/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marco.hernandez/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marco.hernandez/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(pyenv init --path)"


#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source $(brew --prefix kube-ps1)/share/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/.config/zsh/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.config/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.config/zsh/.p10k.zsh

# vim mode
bindkey -v
export KEYTIMEOUT=1
autoload -Uz cursor_mode && cursor_mode

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
