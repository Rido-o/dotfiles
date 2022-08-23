{
  description = "Flake containing all of my overlays";

  inputs = {
    dwm-overlay.url = "path:./dwm";
  };

  outputs = { self, dwm-overlay }: {
    overlays = [
      dwm-overlay.overlay
      (import ./dwmblocks)
      (import ./nsxiv)
      (import ./st)
      (import ./xmenu)
    ];
  };
}
