{ inputs, nixpkgs, home-manager, system, user, pkgs }:
{
  vm = nixpkgs.lib.nixosSystem {
    inherit system pkgs;
    specialArgs = { inherit inputs user; };
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
          users.${user} = {
            imports = [ ./home.nix ./vm/home.nix ];
          };
        };
      }
    ];
  };
}
