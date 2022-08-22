# This file contains all my overlays

# https://nixos.wiki/wiki/Overlays
{
  imports = [
    (import ./dwm)
    (import ./dwmblocks)
    (import ./nsxiv)
    (import ./st)
    (import ./xmenu)
  ];
}
