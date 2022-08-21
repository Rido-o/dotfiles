{ inputs, pkgs, user, ... }: {
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    # packages = with pkgs; [
    # ];
  };
  # Let home-manager install and manage itself
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Rido";
    userEmail = "rido@airmail.cc";
  };
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # Lsp servers
      sumneko-lua-language-server
      rnix-lsp
      nodePackages.pyright
      # Linters
      # flake8
      statix
      # Formatters
      nixpkgs-fmt
      stylua
      black
    ];
  };
  home.stateVersion = "22.05";
}
