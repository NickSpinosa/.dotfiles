{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    vimdiffAlias = true;
  };

  home.file = {
    ".config/nvim".source = ../../config/nvim;
  };
}

