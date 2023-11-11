#!/usr/bin/env bash

set -e

GREEN='\033[1;32m'
RED='\033[1;31m'
CLEAR='\033[0m'

echo "$GREEN} Cloning Dotfiles... ${CLEAR}"
git clone https://github.com/NickSpinosa/.dotfiles.git ~/.dotfiles && cd ~/.dotfiles/
git checkout nix

echo "$GREEN} Linking Dotfiles... ${CLEAR}"
chmod +x ~/.dotfiles/bin/*
~/.dotfiles/bin/link.sh

echo "$GREEN} Running nix flake... ${CLEAR}"
cd ~/.dotfiles/home-manager
nix run . switch

echo "$GREEN} Installing Packer... ${CLEAR}"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "$GREEN} Installing Neovim Plugins via Packer... ${CLEAR}"
nvim --headless +PackerSync +q
