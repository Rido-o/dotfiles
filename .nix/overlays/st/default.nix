self: super: {
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
      (super.fetchpatch {
        url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20220127-2c5edf2.diff";
        sha256 = "CuNJ5FdKmAtEjwbgKeBKPJTdEfJvIdmeSAphbz0u3Uk=";
      })
      (super.fetchpatch {
        url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20220127-2c5edf2.diff";
        sha256 = "8oVLgbsYCfMhNEOGadb5DFajdDKPxwgf3P/4vOXfUFo=";
      })
    ];
    configFile = ./config.def.h;
    postPatch = "cp ${configFile} config.def.h";
  });
}
