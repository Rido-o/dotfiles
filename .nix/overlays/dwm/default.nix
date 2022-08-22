self: super: {
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
}
