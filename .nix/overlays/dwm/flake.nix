{
  description = "Flake containing my build of dwm";

  inputs = {
    dwm.url = "github:Rido-o/dwm-flexipatch";
  };

  outputs = { self, dwm }: {
    overlay =
      self: super: {
        dwm = super.dwm.overrideAttrs (oldAttrs: rec {
          src = dwm;
          buildInputs = oldAttrs.buildInputs ++ [ super.xorg.libxcb ];
        });
      };
  };
}
