# This file defines two overlays and composes them
{ inputs, ... }:
let
  # This one brings our custom packages from the 'pkgs' directory
  # additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = self: super: {
    dwm = super.dwm.overrideAttrs (oldAttrs: rec {
      #src = /home/reid/.local/src/dwm-flexipatch;
      src = super.fetchFromGitHub {
        owner = "Rido-o";
        repo = "dwm-flexipatch";
        rev = "9bfbbd6ada070b3b148600206b32485c2dbe2248"; # Find by running 'git rev-parse HEAD'
        sha256 = "0FyuEzPTM3wU5P0SPopnaA/IcYFoVm5ZjAP6qOqJXv8="; # Find by using super.lib.fakeSha256
      };
      buildInputs = oldAttrs.buildInputs ++ [ super.xorg.libxcb ];
    });
    st = super.st.overrideAttrs (oldAttrs: rec {
      patches = [
        (super.fetchpatch {
          url = "https://st.suckless.org/patches/anysize/st-anysize-20220718-baa9357.diff";
          sha256 = "yx9VSwmPACx3EN3CAdQkxeoJKJxQ6ziC9tpBcoWuWHc=";
        })
        (super.fetchpatch {
          url = "https://st.suckless.org/patches/xresources-with-reload-signal/st-xresources-signal-reloading-20220407-ef05519.diff";
          sha256 = "og6cJaMfn7zHfQ0xt6NKhuDNY5VK2CjzqJDJYsT5lrk=";
        })
        (super.fetchpatch {
          url = "https://st.suckless.org/patches/scrollback/st-scrollback-20210507-4536f46.diff";
          sha256 = "9qzPHaT7Qd03lJfBeFBebvjmJcw8OzVP2nSqLlLr7Pk=";
        })
      ];
      configFile = super.fetchurl {
        url = "https://raw.githubusercontent.com/Rido-o/st/master/config.def.h";
        sha256 = "ips9OcLEZHH6CI2i7juvsAda6BDOkxFQSx9CTBReqr0=";
      };
      postPatch = "cp ${configFile} config.def.h";
    });
    nsxiv = super.nsxiv.overrideAttrs (oldAttrs: rec {
      src = super.fetchFromGitea {
        domain = "codeberg.org";
        owner = "nsxiv";
        repo = "nsxiv";
        rev = "0f0c49a630285af10c765e0b724896ff281e7b66";
        sha256 = "u56gJk7IzwJouawCoU+WGC87KMrhU1CFYvkPUTVRcGM=";
      };
      patches = [];
      configFile = super.fetchurl {
        url = "https://raw.githubusercontent.com/Rido-o/nsxiv/master/config.def.h";
        sha256 = "Zo7EqtQ+JywJZQdmzGN79h6MEh7JPcuRQkuKxH1+x/k=";
      };
      preBuild = "cp ${configFile} config.def.h";
    });
  };
in
inputs.nixpkgs.lib.composeManyExtensions [ modifications ]
