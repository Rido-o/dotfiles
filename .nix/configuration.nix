# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, host, user, ... }:

{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only # Define on which hard drive you want to install Grub.
  boot.loader.grub.useOSProber = true;

  networking.hostName = "${host}"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Display Manager
  services.xserver.displayManager.lightdm.enable = true;

  # Desktop Manager
  services.xserver.desktopManager.xfce.enable = true;

  # Window Manager
  # services.xserver.windowManager.awesome.enable = true;
  services.xserver.windowManager.dwm.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Disable certain wheel users from needing to enter a password on sudo commands
  security.sudo.extraRules = [
    { users = [ "${user}" ];
      commands = [
        { command = "ALL";
	  options = [ "NOPASSWD" ];
    }
      ];
    }
  ];

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Zsh Shell
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histFile = "$HOME/.cache/zsh_history"; # #TODO Create zsh folder
  };
  # users.users.${user}.shell = pkgs.zsh;

  # Fonts
  fonts.fonts = with pkgs; [
    cozette
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    st
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    most
    git
    neovim
    qutebrowser
    xmenu
    gcc # nvim treesitter
    lazygit
    home-manager
    xclip # for putting ssh github key to clipboard
    qutebrowser
  #   wget
  #   firefox
  ];

  nixpkgs.overlays = [
  (self: super: {
    dwm = super.dwm.overrideAttrs (oldAttrs: rec {
      #src = /home/reid/.local/src/dwm-flexipatch;
      src = super.fetchFromGitHub {
      owner = "Rido-o";
      repo = "dwm-flexipatch";
      # Find by running 'git rev-parse HEAD' inside the repo
      rev = "9bfbbd6ada070b3b148600206b32485c2dbe2248";
      # Find by using the error produced when set to super.lib.fakeSha256
      sha256 = "0FyuEzPTM3wU5P0SPopnaA/IcYFoVm5ZjAP6qOqJXv8=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ super.xorg.libxcb ];
    });
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
      ];
      # configFile = 
      # postPatch = oldAttrs.postPatch ++ ''cp ${configFile} config.def.h'';
    });
  })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
