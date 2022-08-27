{ inputs, pkgs, user, ... }: {
  imports = [
    ../modules/git
    ../modules/zsh
    ../modules/nvim
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    packages = with pkgs; [
      nnn
    ];
  };
  # Let home-manager install and manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "22.05";
}
