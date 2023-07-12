{ config, pkgs, lib, user, ... }:

{
  imports =
    [(./hardware-configuration.nix)];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 8;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      timeout = 2;
    };

    supportedFilesystems = [ "ntfs" "exfat" ];
  };

  networking = {
    hostName = "raphael_nas";
    networkmanager.enable = true;
  };

  services = {
    samba = {
      enable = true;
    };
  };

  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/run/current-system/sw/bin"
  '';

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
