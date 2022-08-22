self: super: {
  xmenu = super.xmenu.overrideAttrs (oldAttrs: rec {
    src = super.fetchFromGitHub {
      owner = "phillbush";
      repo = "xmenu";
      rev = "523b3d5e25b90f6336eb4085f611f635350ac9dc";
      sha256 = "RVvU++diBz/LIKsu0j4+xZOG+QpoLypshvrUaSC1cNc=";
    };
    configFile = super.fetchurl {
      url = "https://raw.githubusercontent.com/Rido-o/xmenu/master/config.h";
      sha256 = "x2KBNUw051JBunrpW1tvaAuuX+KGPK1O5VMJgYYRLdE=";
    };
    postPatch = "
      sed -i \"s:/usr/local:$out:\" Makefile
      cp ${configFile} config.h
    ";
  });
}
