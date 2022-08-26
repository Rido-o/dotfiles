{
  programs.git = {
    enable = true;
    userName = "Rido";
    userEmail = "rido@airmail.cc";
    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
      stage = "add";
      unstage = "reset";
      unstage-all = "reset --soft HEAD";
    };
  };
}
