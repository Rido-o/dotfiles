{
  description = "Flake containing all of my overlays";

  inputs = {
    dwm.url = "path:./dwm";
  };

  outputs = { self, dwm }:
  let
    flakes = [
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
