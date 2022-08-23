{
  description = "Flake containing all of my overlays";

  inputs = {
    dwm.url = "path:./dwm";
  };

  outputs = inputs@{ self, ... }:
  let
    flakes = with inputs; [
      dwm.overlay
    ];
  in {
    overlays = flakes ++ [
      (import ./dwmblocks)
      (import ./nsxiv)
      (import ./st)
      (import ./xmenu)
    ];
  };
}
