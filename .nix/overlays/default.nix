# This file contains all my overlays

# https://nixos.wiki/wiki/Overlays
{
  # test = (import ./dwm/flake.nix).outputs;
  imports = [
    # (import ./dwm)
    (import ./dwmblocks)
    (import ./nsxiv)
    (import ./st)
    (import ./xmenu)
  ];
}
