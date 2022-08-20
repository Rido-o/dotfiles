{ inputs, lib, config, pkgs, user, ... }: {
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Rido";
    userEmail = "rido@airmail.cc";
  };
  home.stateVersion = "22.05";
}
