{ pkgs, ... }:
{
  imports = [
    ../../modules/nsxiv
    ../../modules/nnn
  ];
  home = {
    packages = with pkgs; [
      pfetch
      st
      nsxiv
      xmenu
      most
      qutebrowser
      gcc # nvim treesitter
      lazygit
      xclip # for putting ssh github key to clipboard
      # Dwm
      dwmblocks
      dmenu
      sd
      fd
      ripgrep
      pamixer
      mpd
      mpc-cli
      ncmpcpp
      pulsemixer
      gotop
      transmission
      networkmanager_dmenu
    ];
  };
}
