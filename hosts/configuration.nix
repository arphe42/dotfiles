{ config, lib, pkgs, inputs, user, ... }:

{
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.utf8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    xserver = {
      layout = "us";
      xkbVariant = "";

      libinput = {
        enable = true;

        mouse = {
          middleEmulation = false;
        };
      };
    };

    openssh = {
      enable = true;
      passwordAuthentication = false;
    };

    gvfs.enable = true;
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

  # Users
  users.users.${user} = {
    isNormalUser = true;
    description = "Raphael Drouin";
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "flatpak" ];
    shell = pkgs.zsh;                                     # Default shell
  };

  nix = {                                                  # Nix Package Manager settings
    settings = {
      experimental-features = [ "nix-command" "flakes" ];  # Enable nixFlakes
      auto-optimise-store = true;                          # Optimise syslinks
    };
    gc = {                                                 # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
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
    shells = with pkgs; [ zsh bash ];
    pathsToLink = [ "/share/zsh" ];
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
