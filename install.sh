#!/bin/bash

[[ -z "$HOME/dotfiles/nvim" ]] && ln -s "$HOME/dotfiles/nvim/" "$HOME/.config"

[[ -z "$HOME/dotfiles/alacritty" ]] && ln -s "$HOME/dotfiles/alacritty/" "$HOME/.config"
