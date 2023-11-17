{
  description = "Nick's Dotfiles via nix home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, fenix, ... }:
    let
      linux = "x86_64-linux";
      darwin = "aarch64-darwin";


      pkgs = nixpkgs.legacyPackages.${linux};
      # pkgs = import nixpkgs {
      #     system = linux;
      #     overlays = [ (import rust-overlay) ];
      # };
      dpkgs = nixpkgs.legacyPackages.${darwin};

      fenixPkgs = fenix.packages.${linux};
      specialArgs = {
        inherit fenixPkgs;
      };
    in
    {
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
      defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
      defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;


      #wsl
      homeConfigurations."nick" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = specialArgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./wsl/home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
