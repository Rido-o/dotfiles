{ inputs, nixpkgs, home-manager, pkgs }:
let
  host = "nixos";
  user = "example";
in
{
  homeConfigurations = {
    "${user}@${host}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs user; };
      modules = [ ./home.nix ];
    };
  };
}
