{ pkgs, ... }: {
  programs.zsh = {
    prezto.tmux.autoStartLocal = true;
    enable = true;
    oh-my-zsh = {
      theme = "nicoulaj";
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
    shellAliases = {
        zSource = "source ~/.zshrc";
        tSource = "tmux source ~/.config/tmux/tmux.conf";
        vim = "nvim";
        vi = "nvim";
        hs = "home-manager switch --flake ~/.dotfiles/home-manager && zSource && tSource";
        cat = "bat";
        top = "btop";
        win = "cd /mnt/c/Users/nicks";
    };
    initExtra= ''
    . ~/.config/scripts/env.sh
    '';
  };

  home.file.".config/scripts".source = ../../config/scripts;
}
