{
  description = "NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Devshell
    flake-utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell";

    # Neovim-nightly flake
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Overlays flake
    overlays.url = "path:./overlays";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, flake-utils, devshell, overlays, ... }:
  let
    host = "nixos";
    user = "reid";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = with inputs; [
        devshell.overlay
        neovim-nightly-overlay.overlay
      ] ++ overlays.overlays;
    };
  in {
    # NixOS configurations
    nixosConfigurations = {
      ${host} = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = { inherit inputs host user; };
        modules = [
          ./nixos/configuration.nix
          # Default home-manager user configuration
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs user; };
              users.${user} = import ./home-manager/home.nix;
            };
          }
        ];
      };
    };

    # Standalone home-manager configurations
    homeConfigurations = {
      "${user}@${host}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs user; };
        modules = [ ./home-manager/home.nix ];
      };
    };
  } //
  # Commands
  flake-utils.lib.eachDefaultSystem (system: {
    devShells.default = pkgs.devshell.mkShell {
      devshell.motd = "
        My home configs
      ";

      commands = [
        {
          name = "dev:install";
          category = "Install";
          help = "Will install";
          command = "
            sudo nixos-rebuild switch --flake .#nixos
          ";
        }
      ];
    };
  });
}
