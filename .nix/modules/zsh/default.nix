# { pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      dotDir = ".config/zsh";
      history = {
        path = "$HOME/.cache/zsh_history";
      };
      envExtra = ''
        ${builtins.readFile ./.zshenv}
      '';
      initExtra = ''
        ${builtins.readFile ./.zshrc}
      '';
    };
  };
}
