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
  };

  outputs = args@{ self, nixpkgs, home-manager, ... }:
  let
    host = "nixos";
    user = "reid";
    system = "x86_64-linux";
  in {
    # NixOS configurations
    nixosConfigurations = {
      ${host} = nixpkgs.lib.nixosSystem { # TODO set nixos to hostname
        system = "${system}";
        specialArgs = { inherit args host user; };
        modules = [ ./configuration.nix ];
      };
    };

    # Home manager configurations
    homeConfigurations = {
      "${user}@${host}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit args user nixpkgs; };
        modules = [ ./home.nix ];
      };
    };
  };
}
