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
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # NixOS configurations
    nixosConfigurations = {
      ${host} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit args host user; };
        modules = [ ./configuration.nix ];
      };
    };

    # Home manager configurations
    homeConfigurations = {
      "${user}@${host}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit args user nixpkgs; };
        modules = [ ./home.nix ];
      };
    };
  };
}
