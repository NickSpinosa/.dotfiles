#!/usr/bin/env bash

green='\033[0;32m'
is_ubuntu=true

if [ "$(uname)" = "Linux" ]; then
    printf "<========================================>"
    printf " uname is Linux, installing as ubuntu "
    printf "<========================================>\n"
    $is_ubuntu = true 
else
    printf "<========================================>"
    printf " uname is not Linux, installing as mac "
    printf "<========================================>\n"
    $is_ubuntu = false 
fi

printf "<========================================>"
printf " Updating Package Manager "
printf "<========================================>\n"
if [ $is_ubuntu = true ]; then
    apt update;
    apt upgrade -y
else 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

printf "<========================================>"
printf " Installing Packages (zsh, tmux, ripgrep) "
printf "<========================================>\n"
if [ $is_ubuntu = true ]; then
    apt install -y zsh tmux ripgrep
    chsh -s $(which zsh)
else    
    brew install -y tmux ripgrep
fi

printf "<========================================>"
printf " Installing Oh My ZSH "
printf "<========================================>\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

printf "<========================================>"
printf " Installing Packer "
printf "<========================================>\n"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

printf "<========================================>"
printf " Installing TPM "
printf "<========================================>\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

printf "<========================================>"
printf " Installing Rust via Rustup "
printf "<========================================>\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ./rustup.sh && chmod +x ./rustup.sh && ./rustup.sh -y && rm ./rustup.sh && source "$HOME/.cargo/env"

printf "<========================================>"
printf " Installing Neovim via Bob "
printf "<========================================>\n"
cargo install bob-nvim && bob install stable && bob use stable && export PATH = "$HOME/.local/share/bob/nvim-bin":$PATH

printf "<========================================>"
printf " Installing Cargo Watch "
printf "<========================================>\n"
cargo install cargo-watch

printf "<========================================>"
printf " Symlinking Dotfiles "
printf "<========================================>\n"
./link.sh

printf "<========================================>"
printf " Installing node via NVM "
printf "<========================================>\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && source ~/.bashrc
nvm install --lts

printf "<========================================>"
printf " Installing Neovim PLugins via Packer "
printf "<========================================>\n"
nvim --headless +PackerSync +q

printf "<========================================>"
printf " Installing JS Dev Env "
printf "<========================================>\n"
npm install -g eslint typescript ts-node

printf "<========================================>"
printf " Installing Fonts "
printf "<========================================>\n"
git clone https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts && ~/.nerd-fonts/install.sh
