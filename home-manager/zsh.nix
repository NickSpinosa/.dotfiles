{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    oh-my-zsh = {
      theme = "nicoulaj";
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
    shellAliases = {
        zSource = "source ~/.config/zsh/.zshrc";
        tSource = "source ~/.config/tmux/tmux.conf";
        vim = "nvim";
        vi = "nvim";
        hs = "home-manager switch && zSource";
        cat = "bat";
        top = "htop";
    };
    initExtra= ''
    . ~/.config/env/env.sh
    '';
  };
}
