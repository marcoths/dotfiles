
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

fpath=($DOTFILES/zsh/.config/zsh/plugins $fpath)

# +------------+
# | NAVIGATION |
# +------------+

setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

autoload -Uz bd; bd

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.


# +------------+
# | COMPLETION |
# +------------+

# Automatic loading via #compdef in each files (see https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org)
fpath=($DOTFILES/zsh/.config/zsh/plugins/zsh-completions/src $fpath)

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $DOTFILES/zsh/.config/zsh/plugins/completions.zsh

autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# BASE16 themes
BASE16_SHELL=$HOME/.local/lib/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marcoh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marcoh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marcoh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marcoh/google-cloud-sdk/completion.zsh.inc'; fi

# Go development
export GOPATH="${HOME}/dev/"
export GOROOT="$(brew --prefix golang)/libexec"
export GOBIN="${GOPATH}/bin"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GOOGLE_CREDENTIALS="/Users/marcoh/.cfg/devCredentials.json"
# For Go Modules
export GOPRIVATE="nandosuk"
# JWT for testing and development
export NANDOS_API_PLATFORM_TOKEN="$( op get item nandos-api-platform-token --fields JWT)"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias ks="kubeseal"
alias openports="lsof -i -P -n | grep LISTEN"
alias -g Z='| fzf'
alias tnew=tmux new -s $(basename $PWD)
alias tf=terraform
alias config='/usr/bin/git --git-dir=/Users/marcoh/.myconfig/ --work-tree=/Users/marcoh'
alias nandos-dev='gcloud config configurations activate nandos-dev && gcloud config set compute/region europe-west2 && gcloud config set compute/zone europe-west2-a && gcloud auth activate-service-account --key-file ~/.cfg/devCredentials.json && gcloud config set project nandos-api-platform && if [ $(dig +short A -4 api.dev.nandos.services) = "35.235.54.199" ]; then gcloud container clusters get-credentials dev-preview-blue --region europe-west2; else gcloud container clusters get-credentials dev-preview-green --region europe-west2; fi'
alias nandos-preprod='gcloud config configurations activate nandos-dev && gcloud config set compute/region europe-west2 && gcloud config set compute/zone europe-west2-a && gcloud auth activate-service-account --key-file ~/.cfg/devCredentials.json && gcloud config set project nandos-api-platform && if [ $(dig +short A -4 api.preprod.nandos.services) = "35.235.54.199" ]; then gcloud container clusters get-credentials dev-preprod-blue --region europe-west2; else gcloud container clusters get-credentials dev-preprod-green --region europe-west2; fi'
alias nandos-dev-tooling='gcloud config configurations activate nandos-dev && gcloud config  set project nandos-api-platform && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-tooling, dev-tooling-blue, dev-tooling-green)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'
alias gcp1='gcloud config set compute/region us-west2 && gcloud config set compute/zone us-west2-b && gcloud config configurations activate gcp1'
alias gcp2='gcloud config set account hello@marcohernandez.io && gcloud config set compute/region us-east1 && gcloud config set compute/zone us-east1-b && gcloud config configurations activate gcp2'
alias gcp3='gcloud config configurations activate gcp3 && gcloud config set account hellogcp01@gmail.com && gcloud config set compute/region us-central1 && gcloud config set compute/zone us-central1-a && gcloud container clusters get credentials lfd-lab'
alias nandos-dev-test='gcloud config configurations activate nandos-dev && gcloud config set project nandos-api-platform && gcloud config set compute/region europe-west2 && gcloud config set compute/zone europe-west2-a && gcloud auth activate-service-account --key-file ~/.cfg/devCredentials.json && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-test, dev-test-blue, dev-test-green)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'
alias nandos-prod='gcloud config configurations activate nandos-prod && gcloud config set project nandos-api-platform-production && gcloud config set compute/region europe-west2 && gcloud config set compute/zone europe-west2-a && gcloud auth activate-service-account --key-file ~/.cfg/prodCredentials.json && if [ $(dig +short A -4 api.nandos.services) = "34.89.31.15" ]; then gcloud container clusters get-credentials prod-blue --region europe-west2; else gcloud container clusters get-credentials prod-green --region europe-west2; fi'
alias prod='export GOOGLE_APPLICATION_CREDENTIALS="~/.cfg/prodCredentials.json" && gcloud config configurations activate nandos-prod && gcloud config set project nandos-api-platform-production && gcloud config set account platform-provisioning-prod@nandos-api-platform-production.iam.gserviceaccount.com && gcloud config set project nandos-api-platform-production && gcloud auth activate-service-account --key-file ~/.cfg/prodCredentials.json && if [ $(dig +short A -4 api.nandos.services) = "34.89.31.15" ]; then gcloud container clusters get-credentials prod-blue --region europe-west2; else gcloud container clusters get-credentials prod-green --region europe-west2; fi'
# open ~/.zshrc in using the default editor specified in $EDITOR
alias ec="$EDITOR $HOME/.config/zsh/.zshrc"
# source ~/.zshrc
alias sc="source $HOME/.config/zsh/.zshrc"

# git
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'                                                                           # display remote branch
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"                                                              # git log for each branches
alias gsub="git submodule update --remote"                                                        # pull submodules
# bind keys for iTerm
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# bind keys for iTerm
# source /usr/local/Cellar/kube-ps1/0.7.0/share/kube-ps1.sh 
# PROMPT='$(kube_ps1)'$PROMPT
# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export GOOGLE_APPLICATION_CREDENTIALS=$(find ~/.cfg -name devCredentials.json)

# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+

source $DOTFILES/zsh/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# +--------+
# | PROMPT |
# +--------+

fpath=($DOTFILES/zsh/.config/zsh/prompt $fpath)
#autoload -Uz prompt_setup; prompt_setup
eval "$(starship init zsh)"

export PATH="$HOME/.cargo/bin:$PATH"
