{
  description = "Flake containing my build of dwm";

  inputs = {
    dwm-src.url = "github:Rido-o/dwm-flexipatch";
    dwm-src.flake = false;
  };

  outputs = { self, dwm-src }: {
    overlay =
      self: super: {
        dwm = super.dwm.overrideAttrs (oldAttrs: rec {
          src = dwm-src;
          buildInputs = oldAttrs.buildInputs ++ [ super.xorg.libxcb ];
        });
      };
  };
}
