# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, host, user, ... }:

{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader = {
    grub = {
      enable = true;
      version = 2;
      device = "/dev/sda"; # or "nodev" for efi only # Define on which hard drive you want to install Grub.
      # useOSProber = true; # For dual booting
      configurationLimit = 5;
    };
    timeout = 5;
  };

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

  # X11 display settings
  services.xserver = {
    enable = true;
    displayManager = {
        lightdm.enable = true;
        defaultSession = "xfce";
    };
    desktopManager = {
      xfce.enable = true;
    };
    windowManager = {
      dwm.enable = true;
    };
  };

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
  security.sudo.extraRules = [{
    users = [ "${user}" ];
    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];

  nix = {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = ["nix-command" "flakes"];
        # Deduplicate and optimizse nix store
        auto-optimise-store = true;
    };
  };

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
    dmenu
    killall
    dwmblocks sd fd ripgrep pamixer mpd ncmpcpp mpc-cli pulsemixer
    st
    nsxiv
    xmenu
    zsh zsh-syntax-highlighting zsh-autosuggestions
    most
    git
    neovim
    qutebrowser
    gcc # nvim treesitter
    lazygit
    xclip # for putting ssh github key to clipboard
    qutebrowser
  #   wget
  #   firefox
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
