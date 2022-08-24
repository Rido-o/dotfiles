{
  description = "Flake containing an overlay of dmenu";

  inputs = {
    dmenu-src.url = "git+https://git.suckless.org/dmenu";
    dmenu-src.flake = false;
  };

  outputs = { self, dmenu-src }: {
    overlay = self: super: {
      dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
        src = dmenu-src;
        patches = [
          # https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-4.9.diff
          ./patches/dmenu-xresources+modified-20220824.diff
          # https://tools.suckless.org/dmenu/patches/border/dmenu-border-20201112-1a13d04.diff
          # https://tools.suckless.org/dmenu/patches/mouse-support/dmenu-mousesupport-5.1.diff
          ./patches/dmenu-mousesupport+border-20220824.diff
          # https://tools.suckless.org/dmenu/patches/center/dmenu-center-20200111-8cd37e1.diff
          # https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-5.0.diff
          # https://tools.suckless.org/dmenu/patches/password/dmenu-password-5.0.diff
          # https://tools.suckless.org/dmenu/patches/case-insensitive/dmenu-caseinsensitive-5.0.diff
          ## https://tools.suckless.org/dmenu/patches/xresources-alt/dmenu-xresources-alt-5.0.diff
          ./patches/dmenu-center+lineheight+password+caseinsensitive-20220824.diff
        ];
        configFile = ./config.def.h;
        postPatch = "
          ${oldAttrs.postPatch}
          cp ${configFile} config.def.h
        ";
      });
    };
  };
}
