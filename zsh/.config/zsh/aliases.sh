alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias ks="kubeseal"
alias openports="lsof -i -P -n | grep LISTEN"
alias -g Z='| fzf'
alias tnew=tmux new -s $(basename $PWD)
alias tf=terraform
alias gcp1='gcloud config configurations activate personal1 && gcloud config set compute/region us-central1 && gcloud config set project hello-marco-k8s'
alias pers-dev='gcloud config configurations activate personal1 && gcloud config set compute/region us-central1 && gcloud config set compute/zone us-central1-a && gcloud auth activate-service-account --key-file ~/.cfg/gce-default-marco.json && gcloud config set project hello-marco-k8s'
alias nandos-dev='gcloud config configurations activate nandos-dev && gcloud config set compute/region europe-west2 && gcloud config set compute/zone europe-west2-a && gcloud auth activate-service-account --key-file ~/.cfg/dev-credentials.json && gcloud config set project nandos-api-platform && if [ $(dig +short A -4 api.dev.nandos.services) = "35.235.54.199" ]; then gcloud container clusters get-credentials dev-preview-blue --region europe-west2; else gcloud container clusters get-credentials dev-preview-green --region europe-west2; fi'
alias nandos-preprod='gcloud config configurations activate nandos-dev && gcloud config set compute/region europe-west2 && gcloud config set compute/zone europe-west2-a && gcloud auth activate-service-account --key-file ~/.cfg/devCredentials.json && gcloud config set project nandos-api-platform && if [ $(dig +short A -4 api.preprod.nandos.services) = "35.235.54.199" ]; then gcloud container clusters get-credentials dev-preprod-blue --region europe-west2; else gcloud container clusters get-credentials dev-preprod-green --region europe-west2; fi'
alias nandos-dev-tooling='gcloud config configurations activate nandos-dev && gcloud config  set project nandos-api-platform && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-tooling, dev-tooling-blue, dev-tooling-green)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'
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
alias d="dirs -v"
for index ({1..9}) alias "$index"="cd +${index}";
unset index
