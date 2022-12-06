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
    # neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Overlays flake
    overlays.url = "path:./overlays";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, flake-utils, devshell, overlays, ... }:
    let
      user = "reid";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = with inputs; [
          devshell.overlay
          # neovim-nightly-overlay.overlay
        ] ++ overlays.overlays;
      };
    in
    {
      # NixOS configurations
      nixosConfigurations = (
        import ./nixos {
          # inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager system user pkgs;
        }
      );

      # Standalone home-manager configurations
      homeConfigurations = (
        import ./home-manager {
          # inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager pkgs;
        }
      );
    } //
    (import ./devshell.nix {
      inherit flake-utils devshell pkgs;
    });
}
