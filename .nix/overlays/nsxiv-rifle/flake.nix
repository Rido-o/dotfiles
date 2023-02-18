{
  # nix run .#nsxiv-rifle/. .
  description = "A simple script";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nsxiv-rifle-src.url = "https://codeberg.org/nsxiv/nsxiv-extra/raw/branch/master/scripts/nsxiv-rifle/nsxiv-rifle";
  inputs.nsxiv-rifle-src.flake = false;

  outputs = { self, nixpkgs, flake-utils, nsxiv-rifle-src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        my-name = "nsxiv-rifle";
        my-buildInputs = with pkgs; [ nsxiv ];
        my-script = (pkgs.writeScriptBin my-name (builtins.readFile "${nsxiv-rifle-src}")).overrideAttrs (old: {
          buildCommand = "${old.buildCommand}\n patchShebangs $out";
        });
      in
      rec {
        defaultPackage = packages.my-script;
        packages.my-script = pkgs.symlinkJoin {
          name = my-name;
          paths = [ my-script ] ++ my-buildInputs;
          buildInputs = [ pkgs.makeWrapper ];
          postBuild = "wrapProgram $out/bin/${my-name} --prefix PATH : $out/bin";
        };
      }
    );
}
