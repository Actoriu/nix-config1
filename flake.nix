{
  description = "Nix configuration collection";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-21.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, flake-utils, home-manager, neovim }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in { devShell = import ./shell.nix { inherit pkgs; }; }) // {
        nixosConfigurations = {
          work = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ ./machines/work ];
          };
        };
        homeManagerConfigurations = {
          c4droid = home-manager.lib.homeManagerConfiguration {
            system = "x86_64-linux";
            username = "c4droid";
            homeDirectory = "/home/c4droid";
            configuration = { ... }: {
              nixpkgs.overlays = [ neovim.overlay ];
              imports = [ ./users/c4droid/home.nix ];
            };
          };
        };
        defaultPackage.x86_64-linux =
          self.homeManagerConfigurations.c4droid.activationPackage;
      };
  nixConfig = {
    bash-prompt = "(nix-shell) ";
    bash-prompt-suffix = "\\u\\h \\W \\$ ";
  };
}
