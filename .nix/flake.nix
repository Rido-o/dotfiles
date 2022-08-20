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

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    host = "nixos";
    user = "reid";
    system = "x86_64-linux";
    forAllSystems = nixpkgs.lib.genAttrs [system];
  in rec {
    overlays = { default = import ./overlay { inherit inputs; }; };
    legacyPackages = forAllSystems (system:
      import inputs.nixpkgs {
        inherit system;
        overlays = builtins.attrValues overlays;
    });

    # NixOS configurations
    nixosConfigurations = {
      ${host} = nixpkgs.lib.nixosSystem {
        inherit system;
        pkgs = legacyPackages.${system};
        specialArgs = { inherit inputs host user; };
        modules = [ ./configuration.nix ];
      };
    };

    # Home manager configurations
    homeConfigurations = {
      "${user}@${host}" = home-manager.lib.homeManagerConfiguration {
        pkgs = legacyPackages.${system};
        extraSpecialArgs = { inherit inputs user; };
        modules = [ ./home.nix ];
      };
    };
  };
}
