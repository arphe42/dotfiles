{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    displayManager = {
      sddm = {
        enable = true;
      };
      setupCommands = "${pkgs.xorg.xrandr} --output DP-4 --mode 3440x1440 --pos 200x1080 --rate 144 --primary --output DP-0 --mode 1920x1080 --pos 1920x0 --rate 144 --output DP-2 --mode 1920x1080 --pos 0x0 --rate 144";
    };
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
  ];

  programs.dconf.enable = true;
}
