{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    displayManager.sddm.enable = true;
    desktopManager.plasma5 = {
      enable = true;
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    plasma-browser-integration
    print-manager
    dolphin
  ];

  programs.dconf.enable = true;
}
