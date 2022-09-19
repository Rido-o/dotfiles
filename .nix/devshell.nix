{ flake-utils, devshell, pkgs }:
flake-utils.lib.eachDefaultSystem (system: {
  devShells.default = pkgs.devshell.mkShell {
    devshell.motd = ''
      {bold}{14}~ NixOS command center ~{reset}
      $(type -p menu &>/dev/null && menu)
    '';

    commands = [
      {
        name = "dev:switch";
        category = "Install";
        help = "Updates changes made to configuration.nix";
        command = ''
          sudo nixos-rebuild switch --flake .#$1
        '';
      }
      {
        name = "dev:update";
        category = "Install";
        help = "Updates the entire system and all packages";
        command = ''
          sudo nixos-rebuild switch --flake .#$1 --recreate-lock-file
        '';
      }
      {
        name = "dev:lock";
        category = "Install";
        help = "Updates lock file only";
        command = ''
          nix flake update
        '';
      }
      {
        name = "dev:input-switch";
        category = "Install";
        help = "Updates input and switch";
        command = ''
          sudo nixos-rebuild switch --flake .#$1 --update-input $2
        '';
      }
      {
        name = "dev:clean";
        category = "Maintenance";
        help = "Perform garbage collection and delete all old generations";
        command = ''
          sudo nix-collect-garbage
        '';
      }
    ];
  };
})
