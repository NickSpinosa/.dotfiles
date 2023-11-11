#!/usr/bin/env zsh
set -e

if [[ -z $DOTFILES ]]; then
	DOTFILES=$HOME/.dotfiles
fi

#configuration folders that should be symlinked to .config
if [[ -z $CONFIG_FOLDERS ]]; then
	CONFIG_FOLDERS="nvim,kitty,nix,home-manager,env"
fi

for folder in $(echo $CONFIG_FOLDERS | sed "s/,/ /g")
do
	echo " removing ~/.config/$folder "
	rm -rf ~/.config/$folder
	echo " symlinking $DOTFILES/$folder to ~/.config/$folder "
	ln -s $DOTFILES/$folder ~/.config
done
