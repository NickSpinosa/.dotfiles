{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    vimdiffAlias = true;
    # plugins = with vimPlugins; [
    #    neodev-nvim 
    #    vim-test
    #    vim-tmux-navigator
    #    nvim-treesitter
    #    harpoon
    # ];
    # extraLuaConfig = ''
    #   require("nspinosa")
    # '';
  };

  home.file = {
    ".config/nvim".source = ../../config/nvim;
  };
}

