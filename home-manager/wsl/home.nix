{ pkgs, fenixPkgs, ... }: {

  home.stateVersion = "23.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.packages = with pkgs; callPackage ../shared/packages.nix { inherit fenixPkgs; } ++ [
    ghc
  ];

  imports = [
    ../shared/base.nix
  ];
}
