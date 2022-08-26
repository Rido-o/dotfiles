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
    # Commands
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default = pkgs.devshell.mkShell {
        devshell.motd = ''
          {bold}{14}~ NixOS command center ~{reset}
          $(type -p menu &>/dev/null && menu)
        '';

        commands = [
          {
            name = "dev:switch";
            category = "Install";
            help = "Updates changes made to configuration.nix";
            command = ''
              sudo nixos-rebuild switch --flake .#$1
            '';
          }
          {
            name = "dev:update";
            category = "Install";
            help = "Updates the entire system and all packages";
            command = ''
              sudo nixos-rebuild switch --flake .#$1 --recreate-lock-file
            '';
          }
          {
            name = "dev:lock";
            category = "Install";
            help = "Updates lock file only";
            command = ''
              nix flake update
            '';
          }
          {
            name = "dev:input-switch";
            category = "Install";
            help = "Updates input and switch";
            command = ''
              sudo nixos-rebuild switch --flake .#$1 --update-input $2
            '';
          }
          {
            name = "dev:clean";
            category = "Maintenance";
            help = "Perform garbage collection and delete all old generations";
            command = ''
              sudo nix-collect-garbage
            '';
          }
        ];
      };
    });
}
