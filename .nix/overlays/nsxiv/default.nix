self: super: {
  # Add nsxiv-rifle or something equivalent
  nsxiv = super.nsxiv.overrideAttrs (oldAttrs: rec {
    src = super.fetchFromGitea {
      domain = "codeberg.org";
      owner = "nsxiv";
      repo = "nsxiv";
      rev = "0f0c49a630285af10c765e0b724896ff281e7b66";
      sha256 = "u56gJk7IzwJouawCoU+WGC87KMrhU1CFYvkPUTVRcGM=";
    };
    patches = [ ];
    configFile = super.fetchurl {
      url = "https://raw.githubusercontent.com/Rido-o/nsxiv/master/config.def.h";
      sha256 = "Zo7EqtQ+JywJZQdmzGN79h6MEh7JPcuRQkuKxH1+x/k=";
    };
    preBuild = "cp ${configFile} config.def.h";
  });
}
