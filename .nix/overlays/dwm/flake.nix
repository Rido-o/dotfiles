{
  description = "A very basic flake";

  inputs = {
    dwm.url = "github:Rido-o/dwm-flexipatch";
    dwm.flake = false;
  };

  outputs = { self, nixpkgs, dwm }: {
    overlays.dwm =
      self: super: {
        dwm = super.dwm.overrideAttrs (oldAttrs: rec {
          #src = /home/reid/.local/src/dwm-flexipatch;
          src = super.dwm.url {
          };
          buildInputs = oldAttrs.buildInputs ++ [ super.xorg.libxcb ];
        });
      };
    # packages.x86_64-linux.dwm = nixpkgs.legacyPackages.x86_64-linux.dwm;
    #
    # defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
  };
}
