{ config, lib, pkgs, inputs, user, ... }:

{
  time.timeZone = "America/Toronto";                       # Time zone and internationalisation
  i18n.defaultLocale = "en_CA.utf8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    xserver = {
      libinput.enable = true;                              # needed for all input devices
    };

    openssh = {                                            # SSH
      enable = true;
    };

    gvfs.enable = true;                                    # autodetect external drive
  };

  # PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Flatpak
  services.flatpak.enable = true;
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };

  # Fonts
  fonts.fonts = with pkgs; [
    font-awesome                                           # Icons
    corefonts
    source-code-pro
  ];

  # Users
  users.users.${user} = {
    isNormalUser = true;
    description = "Raphael Drouin";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;                                     # Default shell
  };

  nixpkgs.config.allowUnfree = true;                       # Allow unfree packages

  nix = {                                                  # Nix Package Manager settings
    settings = {
      experimental-features = [ "nix-command" "flakes" ];  # Enable nixFlakes
      auto-optimise-store = true;                          # Optimise syslinks
    };
    gc = {                                                 # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    systemPackages = with pkgs; [                          # Default packages system-wide
      neovim
      git
      wget
    ];
  };

  system = {
    stateVersion = "22.11";
  };
}
