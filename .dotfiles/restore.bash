#!/bin/bash
# ~/.local/bin/init-env-dotfiles.sh
git clone --bare git@github.com:ScreamingSUN13/dotfiles $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

config checkout --force
config config status.showUntrackedFiles no

## Download major packages
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
  dolphin \
	git \
	lazygit \
	qt6ct \
	qt5ct \
	os-prober \
	okular \
	pastel \
	gwenview \
	ttf-jetbrains-mono \
	mpv

yay -S --needed \
	oh-my-posh \
	sddm-silent-theme \
	cliamp
