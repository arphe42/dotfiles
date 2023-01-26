{ config, pkgs, lib, user, ... }:

{
  imports =
    [(./hardware-configuration.nix)] ++
    [(../../modules/displayManager/startx.nix)] ++
    [(../../modules/displayManager/sddm.nix)] ++
    [(../../modules/desktop/xfce4+awesome.nix)] ++
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
        efiSysMountPoint = "/boot/efi";
      };
      timeout = 2;
    };
  };

  networking = {
    hostName = "raphaelpc";
    networkmanager.enable = true;
  };

  # Screen layout
  services.xserver.xrandrHeads = [
    {
      output = "DP-4";
      monitorConfig = ''
        Option "PreferredMode" "3440x1440"
        Option "Rate" "144"
      '';
      primary = true;
    }
    {
      output = "DP-2";
      monitorConfig = ''
        Option "PreferredMode" "1080x1920"
        Option "Rate" "144"
      '';
    }
    {
      output = "HDMI-0";
      monitorConfig = ''
        Option "PreferredMode" "1920x1080"
        Option "Rate" "144"
      '';
    }
  ];
  # Nvidia Driver 
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [];

  services = {
    blueman.enable = true;

    samba = {
      enable = true;
    };
  };

  services.deluge.enable = true;
  services.deluge.openFirewall = true;

  services.transmission.enable = true;
  services.transmission.openFirewall = true;
  services.transmission.user = "raphael";

  #programs.weylus = {
  #  enable = true;
  #};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
