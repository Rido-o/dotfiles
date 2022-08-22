self: super: {
  dwmblocks = super.dwmblocks.overrideAttrs (oldAttrs: rec {
    src = super.fetchFromGitHub {
      owner = "UtkarshVerma";
      repo = "dwmblocks-async";
      rev = "68e1ce8e31f986023b1fd959d0efa2c320ea502f";
      sha256 = "svEV9aCXyPnTiabtCQz+OxQgbf/jnQrmolAeW0JtfrE=";
    };
    configFile = super.fetchurl {
      url = "https://raw.githubusercontent.com/Rido-o/dwmblocks-async/master/config.h";
      sha256 = "90Oi0nmr179shmysNOorIIFJZOsoxC0Zn0Q/GIi6Fmo=";
    };
    postPatch = "cp ${configFile} config.h";
  });
}
