self: super: {
  dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
    patches = [
      (super.fetchpatch {
        url = "https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-4.9.diff";
        sha256 = "Np9I8hhnwmGA3W5v4tSrBN9Or8Q2Ag9x8H3yf8L9jDI=";
      })
      ./patches/dmenu-mousesupport+border-20220824.diff
      ./patches/dmenu-center+lineheight+password+caseinsensitive-20220824.diff
      # (super.fetchpatch { # Conflits with mouse support
      #   url = "https://tools.suckless.org/dmenu/patches/border/dmenu-border-20201112-1a13d04.diff";
      #   sha256 = "Trpa82H0DNZ/s4vuXnf4kAsqSgOld6WJhQ8nKH/Bbzc=";
      # })
      # (super.fetchpatch { # Conflicts with border
      #   url = "https://tools.suckless.org/dmenu/patches/mouse-support/dmenu-mousesupport-5.1.diff";
      #   sha256 = "VlDHVikCV5DmJVl1a5cKpxfwzYUC3jJ5zGTunBEiyl0=";
      # })
      #-------------------------------------
      # (super.fetchpatch { # Conflicts with case-insensitive
      #   url = "https://tools.suckless.org/dmenu/patches/center/dmenu-center-20200111-8cd37e1.diff";
      #   sha256 = "dpiuLno7EE8VyZiDegD1CSdbqaRIQTzMg4aEJFiEQTQ=";
      # })
      # (super.fetchpatch { # Conflicts with password # Conflicts with case-insensitive
      #   url = "https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-5.0.diff";
      #   sha256 = "St1x4oZCqDnz7yxw7cQ0eUDY2GtL+4aqfUy8Oq5fWJk=";
      # })
      # (super.fetchpatch { # Conflicts with line height # Conflicts with case-insensitive
      #   url = "https://tools.suckless.org/dmenu/patches/password/dmenu-password-5.0.diff";
      #   sha256 = "ZB5l8Vzm7tTnLmDvAZZgIWjMpiZLenp2rbR0GdXRe08=";
      # })
      # (super.fetchpatch { # Conflicts with password # Conflicts with line-height # Conflicts with center
      #   url = "https://tools.suckless.org/dmenu/patches/case-insensitive/dmenu-caseinsensitive-5.0.diff";
      #   sha256 = "XqFEBRu+aHaAXrNn+WXnkIuC/vAHDIb/im2UhjaPYC0=";
      # })
    ];
    # configFile = super.fetchurl {
    #   url = "";
    #   sha256 = super.lib.fakeSha256;
    # };
    # postPatch = oldAttrs.preBuild + "cp ${configFile} config.def.h";
  });
}
