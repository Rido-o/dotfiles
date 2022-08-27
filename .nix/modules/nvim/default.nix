{ pkgs, ... }:
{
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
}
