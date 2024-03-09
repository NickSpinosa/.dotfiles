{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    vimdiffAlias = true;
    # package = pkgs.neovim-nightly;
  };

  home.file = {
    ".config/nvim".source = ../../config/nvim;
  };
}

