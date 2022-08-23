{
  description = "Flake containing all of my overlays";

  inputs = {
    dwm.url = "path:./dwm";
    dwmblocks.url = "path:./dwmblocks";
    nsxiv.url = "path:./nsxiv";
    xmenu.url = "path:./xmenu";
  };

  outputs = inputs@{ self, ... }:
  let
    flakes = with inputs; [
      dwm.overlay
      dwmblocks.overlay
      nsxiv.overlay
      xmenu.overlay
    ];
  in {
    overlays = flakes ++ [
      (import ./st)
    ];
  };
}
