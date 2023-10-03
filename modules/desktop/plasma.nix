{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    displayManager = {
      sddm = {
        enable = true;
      };
      setupCommands = "
        xrandr --output DP-4 --mode 3440x1440 --pos 1920x188  --rotate normal  --rate 144 --primary --output DP-0   --mode 1920x1080 --pos 5360x0    --rotate right   --rate 144 --output HDMI-0 --mode 1920x1080 --pos 0x188     --rotate normal  --rate 144
      ";
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
    dolphin
  ];

  programs.dconf.enable = true;
}
