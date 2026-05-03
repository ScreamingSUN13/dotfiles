#!/bin/bash
# ~/.local/bin/init-env-dotfiles.sh
git clone --bare git@github.com:ScreamingSUN13/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

config checkout --force
config config status.showUntrackedFiles no
