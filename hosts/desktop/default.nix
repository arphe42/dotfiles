{ config, pkgs, lib, user, ... }:

{
  imports =
    [(./hardware-configuration.nix)] ++
    [(../../modules/desktop/awesome/default.nix)] ++
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
