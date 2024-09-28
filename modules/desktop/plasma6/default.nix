{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
    
    desktopManager.plasma6 = {
      enable = true;
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    print-manager
  ];

  programs.dconf.enable = true;
}
