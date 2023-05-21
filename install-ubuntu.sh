#!/usr/bin/env bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install zsh
sudo apt install neovim
sudo apt install tmux
#oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
#tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
