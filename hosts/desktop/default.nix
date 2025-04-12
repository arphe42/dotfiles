{ config, pkgs, lib, user, hyprland, aagl, ... }:

{
  imports =
    [(./hardware-configuration.nix)] ++
    [(../../modules/displayManager/startx.nix)] ++
    [(../../modules/desktop/plasma6)] ++
    #[(../../modules/desktop/hyprland)] ++
    [(../../modules/programs/steam.nix)] ++
    [(../../modules/hardware/bluetooth.nix)];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;    # Use the latest kernel

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi = {
        canTouchEfiVariables = true;
        #efiSysMountPoint = "/boot/efi";
      };
      timeout = 2;
    };
    kernelParams = [
      "splash"
    ];

    supportedFilesystems = [ "ntfs" "exfat" ];
    kernelModules = [ "i2c-dev" "i2c-piix4" "uinput" ];
  };

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  
  networking = {
    hostName = "raphaelpc";
    networkmanager.enable = true;
  };

  hardware.pulseaudio.enable = false;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.kcmutils
  ];


  services = {
    # blueman.enable = true;     # bluetooth applet

    samba = {
      enable = true;
    };

    hardware.openrgb = {
      enable = true;
      motherboard = "amd";
      server.port = 6742;
    };

    ratbagd = {
      enable = true;
    };

    asusd = {
      enable = true;
    };

    resolved = {
      enable = true;
      domains = [
        "local"
      ];
    };

    esphome.enable = true;
  };

  security.polkit.enable = true;

  services.deluge.enable = true;
  services.deluge.openFirewall = true;

  services.transmission.enable = true;
  services.transmission.openFirewall = true;
  services.transmission.user = "raphael";

  programs = {
    firefox.enable = true;
    weylus = {
      enable = true;
      openFirewall = true;
      users = [ "raphael" ];
    };

    alvr = {
      enable = true;
      openFirewall = true;
    };

    rog-control-center = {
      enable = true;
    };

    dconf.enable = true;
    # nm-applet.enable = true;
  };

  services.udev.extraRules = ''
    KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput", GROUP="input", MODE="0660"
    ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000c", MODE="664", GROUP="uucp"
    ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0003", MODE="664", GROUP="uucp"
  '';

  # needed for swaylock to have password
  security.pam.services.swaylock.text = ''
    # PAM configuration file for the swaylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';

  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/run/current-system/sw/bin"
  '';

  environment = {
    variables = {
      LD_LIBRARY_PATH = "/lib";
      AMD_VULKAN_ICD = "RADV";
    };
    sessionVariables = {
      PATH = [
        "~/.cargo/bin"
      ];
    };
  };

  # Open ports in the firewall.
  networking.firewall = {
    allowedTCPPorts = [
      # Sunshine
      47984
      47989
      47990
      48010

      #deskflow
      24800

      # Minecraft
      25565 # Game
      4123  # LiveKit
      8100  # BlueMap
    ];
    allowedTCPPortRanges = [
      { # KDE Connect
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPorts = [
      4010
      # Minecraft
      25565 # Game
      4123  # LiveKit
      8100  # BlueMap
    ];
    allowedUDPPortRanges = [
      { # KDE Connect
        from = 1714;
        to = 1764;
      }
      { # Sunshine
        from = 47998;
        to = 48000;
      }
    ];
  };
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
