{
  description = "Flake containing an overlay of xmenu";

  inputs = {
    xmenu-src.url = "github:phillbush/xmenu";
    xmenu-src.flake = false;
  };

  outputs = { self, xmenu-src }: {
    overlay = self: super: {
      xmenu = super.xmenu.overrideAttrs (oldAttrs: rec {
        src = xmenu-src;
        configFile = super.fetchurl {
          url = "https://raw.githubusercontent.com/Rido-o/xmenu/master/config.h";
          sha256 = "x2KBNUw051JBunrpW1tvaAuuX+KGPK1O5VMJgYYRLdE=";
        };
        postPatch = "
          sed -i \"s:/usr/local:$out:\" Makefile
          cp ${configFile} config.h
        ";
      });
    };
  };
}
