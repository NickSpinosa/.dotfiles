{ pkgs, ... }: {

  home.file = {
    ".config/kitty".source = ../../config/kitty;
    ".config/nix/nix.conf".text = ''
      experimental-features = nix-command flakes
    '';
  };

  imports = [
    ./tmux.nix
    ./zsh.nix
    ./neovim.nix
  ];    
}
