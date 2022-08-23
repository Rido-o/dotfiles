{
  description = "Flake containing an overriding dwmblocks with dwmblocks-async";

  inputs = {
    dwmblocks-src.url = "github:UtkarshVerma/dwmblocks-async";
    dwmblocks-src.flake = false;
  };

  outputs = { self, dwmblocks-src }: {
    overlay = self: super: {
      dwmblocks = super.dwmblocks.overrideAttrs (oldAttrs: rec {
        src = dwmblocks-src;
        configFile = super.fetchurl {
          url = "https://raw.githubusercontent.com/Rido-o/dwmblocks-async/master/config.h";
          sha256 = "90Oi0nmr179shmysNOorIIFJZOsoxC0Zn0Q/GIi6Fmo=";
        };
        postPatch = "cp ${configFile} config.h";
      });
    };
  };
}
