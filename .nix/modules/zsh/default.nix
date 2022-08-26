{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      dotDir = ".config/zsh";
      history = {
        path = "$HOME/.cache/zsh_history";
        size = 10000;
        save = 10000;
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
