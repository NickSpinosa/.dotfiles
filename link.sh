#!/usr/bin/env zsh

if [[ -z $DOTFILES ]]; then
	DOTFILES=$HOME/.dotfiles
fi

#configuration folders that should be symlinked to .config
if [[ -z $CONFIG_FOLDERS ]]; then
	CONFIG_FOLDERS="nvim,tmux,zsh,kitty"
fi

#symlink zsh
ln $DOTFILES/zsh/.zshrc ~/.zshrc

for folder in $(echo $CONFIG_FOLDERS | sed "s/,/ /g")
do
    printf "<========================================>"
	echo " symlinking $DOTFILES/$folder to ~/.config/${$folder} "
    printf "<========================================>\n"
	ln -s $DOTFILES/$folder ~/.config
done
