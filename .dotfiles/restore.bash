#!/bin/bash
# ~/.local/bin/init-env-dotfiles.sh
git clone --bare git@github.com:ScreamingSUN13/dotfiles $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

config checkout --force
config config status.showUntrackedFiles no

sudo pacman -S --needed \
	yay \
	flatpak \
	zen-browser \
	vesktop-bin \
	steam \
	nvim \
	niri \
	yazi \
	atuin \
	fastfetch \
	fish \
	btop \
	kitty \
	noctalia \
	sddm \
	libreoffice \
  dolphin

yay -S --needed \
	oh-my-posh \
	cliamp
