{
  description = "Flake containing an overlay of nsxiv";

  inputs = {
    nsxiv-src.url = "git+https://codeberg.org/nsxiv/nsxiv";
    nsxiv-src.flake = false;
  };

  outputs = { self, nsxiv-src }: {
    overlay = self: super: {
      nsxiv = super.nsxiv.overrideAttrs (oldAttrs: rec {
        src = nsxiv-src;
        patches = [
          (super.fetchpatch {
            url = "https://codeberg.org/nsxiv/nsxiv-extra/raw/branch/master/patches/load-dir/load-dir-3a22e6a.patch";
            sha256 = "MrCUJlGt660CdMF/saeZzpshPiOKvbefWB7kCUdgDq4=";
          })
        ];
        configFile = super.fetchurl {
          url = "https://raw.githubusercontent.com/Rido-o/nsxiv/master/config.def.h";
          sha256 = "Zo7EqtQ+JywJZQdmzGN79h6MEh7JPcuRQkuKxH1+x/k=";
        };
        preBuild = "cp ${configFile} config.def.h";
      });
    };
  };
}
