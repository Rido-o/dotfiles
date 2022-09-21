{ pkgs, ... }:
rec {
  programs = {
    nnn = {
      enable = true;
      plugins.src = pkgs.fetchFromGitHub
        {
          owner = "jarun";
          repo = "nnn";
          rev = "v4.6";
          sha256 = "sha256-Hpc8YaJeAzJoEi7aJ6DntH2VLkoR6ToP6tPYn3llR7k=";
        } + /plugins;
    };
    zsh.initExtra = ''
      ${builtins.readFile ./.zshrc}
    '';
  };
  home.sessionVariables = {
    LC_COLLATE = "C";
    NNN_PLUG_PLUGINS = "d:fzcd;f:fzopen;j:fzz";
    NNN_PLUG_COMMANDS = ''s:_git status;u:_git add -u;c:_git commit;p:_git push origin master;l:_lazygit*;e:_sudoedit $nnn*'';
    NNN_PLUG = "${home.sessionVariables.NNN_PLUG_PLUGINS};${home.sessionVariables.NNN_PLUG_COMMANDS}";
    NNN_TRASH = 1;
  };
}
