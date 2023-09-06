{ config, pkgs, lib, user, hyprland, aagl, ... }:

{
  imports =
    [(./hardware-configuration.nix)] ++
    [(../../modules/displayManager/startx.nix)] ++
    #[(../../modules/displayManager/lightdm.nix)] ++
    [(../../modules/desktop/hyprland)] ++
    [(../../modules/desktop/awesome)] ++
    [(../../modules/programs/steam.nix)] ++
    [(../../modules/programs/an-anime-game-launcher.nix)] ++
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
        efiSysMountPoint = "/boot/efi";
      };
      timeout = 2;
    };
    kernelParams = [
      "splash"
      "nvidia-drm.modeset=1"
    ];

    supportedFilesystems = [ "ntfs" "exfat" ];
  };

  
  networking = {
    hostName = "raphaelpc";
    networkmanager.enable = true;
  };

  hardware.pulseaudio.enable = false;

  # Nvidia Driver 
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
  ];


  services = {
    blueman.enable = true;

    samba = {
      enable = true;
    };
  };

  security.polkit.enable = true;

  services.deluge.enable = true;
  services.deluge.openFirewall = true;

  services.transmission.enable = true;
  services.transmission.openFirewall = true;
  services.transmission.user = "raphael";

  programs = {
    weylus = {
      enable = true;
      openFirewall = true;
      users = [ "raphael" ];
    };
    nm-applet.enable = true;
  };

  # needed for swaylock to have password
  security.pam.services.swaylock.text = ''
    # PAM configuration file for the swaylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';

  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/run/current-system/sw/bin"
  '';

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    8080
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
