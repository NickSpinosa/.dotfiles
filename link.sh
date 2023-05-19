#!/usr/bin/env zsh
if [[ -z $DOTFILES ]]; then
	DOTFILES=$HOME/.dotfiles
fi

#configuration folders that should be symlinked to root
if [[ -z $FLAT_FOLDERS ]]; then
	FLAT_FOLDERS="tmux,zsh"
fi

#configuration folders that should be symlinked to .config
if [[ -z $CONFIG_FOLDERS ]]; then
	CONFIG_FOLDERS="nvim"
fi

for folder in $(echo $FLAT_FOLDERS | sed "s/,/ /g")
do
	echo "symlinking $DOTFILES/$folder to ~"
	ln -s $DOTFILES/$folder ~
done

for folder in $(echo $CONFIG_FOLDERS | sed "s/,/ /g")
do
	echo "symlinking $DOTFILES/$folder to ~"
	ln -s $DOTFILES/$folder ~/.config
done
