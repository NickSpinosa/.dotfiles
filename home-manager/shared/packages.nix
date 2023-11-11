{ pkgs }:
with pkgs; [
  #test
  hello

  #dev env
  neovim
  git
  gh
  oh-my-zsh
  htop
  (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; })
  direnv
  ripgrep
  bat
  btop

  #rust env
  rustup
  cargo-watch
  gcc
  zig

  #ts env
  nodejs_20
  nodePackages.ts-node
  nodePackages.typescript
]
