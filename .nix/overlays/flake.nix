{
  description = "Flake containing all of my overlays";

  inputs = {
    dwm.url = "path:./dwm";
    dwmblocks.url = "path:./dwmblocks";
    nsxiv.url = "path:./nsxiv";
    xmenu.url = "path:./xmenu";
    dmenu.url = "path:./dmenu";
  };

  outputs = inputs@{ self, ... }: {
    overlays = with inputs; [
      # Flakes
      dwm.overlay
      dwmblocks.overlay
      nsxiv.overlay
      xmenu.overlay
      # dmenu.overlay
    ] ++ [
      # Normal overlays
      (import ./st)
    ];
  };
}
