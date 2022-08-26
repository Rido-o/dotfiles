{ inputs, nixpkgs, home-manager, system, user, pkgs }:
let
  host = "nixos";
in
{
  vm = nixpkgs.lib.nixosSystem {
    inherit system pkgs;
    specialArgs = { inherit inputs host user; };
    modules = [
      ./configuration.nix
      ./vm
      # Default home-manager user configuration
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs user; };
          users.${user} = import ./home.nix;
        };
      }
    ];
  };
}
