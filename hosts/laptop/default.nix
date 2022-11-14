{ config, pkgs, user, ... }:

{
  imports =
    [(import ./hardware-configuration.nix)] ++
    [(import ../../modules/desktop/awesome/default.nix)] ++
    [(import ../../modules/programs/steam.nix)] ++
    [(import ../../modules/hardware/bluetooth.nix)];

  boot = {
    #kernelPackages = pkgs.linuxPackages_latest;     # Use the latest kernel

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
    hostName = "raphael-laptop";
    networkmanager.enable = true;
  };
  programs.nm-applet.enable = true;                  # Have the applet in systray

  environment = {
    systemPackages = with pkgs; [];
  };

  hardware = {
    steam-hardware.enable = true;             # Needed for controler to work
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services = {
    samba = {
      enable = true;
      #share = {};
    };

    xserver = {
      videoDrivers = [ "nvidia" "intel" ];
    };
  };
}
