{ pkgs, fenixPkgs }:
with pkgs; [
  #test
  hello

  #dev env
  git
  gh
  oh-my-zsh
  htop
  (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; })
  direnv
  ripgrep
  bat
  btop
  xclip

  #rust env
  fenixPkgs.stable.toolchain
  cargo-watch
  gcc
  zig

  #ts env
  nodejs_20
  nodePackages.ts-node
  nodePackages.typescript
]
