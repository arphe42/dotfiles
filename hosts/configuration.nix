{ config, lib, pkgs, inputs, user, ... }:

{
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.utf8";

  console = {
    font = "Hack Nerd";
    keyMap = "us";
  };

  fonts = {
    packages = with pkgs; [
      font-awesome                     # Icons
      corefonts                        # MS
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
    ];

    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "jetbrains-mono" ];
        sansSerif = [ "jetbrains-mono" ];
        monospace = [ "jetbrains-mono" ];
      };
    };
  };

  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    libinput = {
      enable = true;
      mouse = {
        middleEmulation = false;
      };
    };

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
      };
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
    wireplumber.enable = true;
  };

  # Flatpak
  services.flatpak.enable = true;
  services.dbus.enable = true;
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        #xdg-desktop-portal-wlr
      ];
    };
  };

  # Disable sudo
  security.sudo.enable = false;
  # Use doas
  security.doas = {
    enable = true;
    extraRules = [{
      groups = [ "wheel" ];
      persist = true;
      keepEnv = true;
    }];
  };

  # Users
  users.users.${user} = {
    isNormalUser = true;
    description = "Raphael Drouin";
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "flatpak" "uucp" "dialout" ];
    shell = pkgs.zsh;                                     # Default shell
  };

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;                       # Allow unfree packages

  nix = {                                                  # Nix Package Manager settings
    settings = {
      experimental-features = [ "nix-command" "flakes" ];  # Enable nixFlakes
      auto-optimise-store = true;                          # Optimise syslinks
      substituters = [ "https://ezkea.cachix.org" ];
      trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
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
    stateVersion = "24.11";
  };
}
