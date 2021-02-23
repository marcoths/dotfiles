# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

starship init fish | source
set PATH $HOME/.cargo/bin $HOME/.local/bin $PATH

abbr g 'git'
abbr ga 'git add'
abbr gc 'git commit -m'
abbr gca 'git commit --amend -m'
abbr gco 'git checkout'
abbr gb 'git branch'
abbr gbl 'git blame'
abbr gp 'git push'
abbr gst 'git status'

abbr vi 'nvim.appimage'

