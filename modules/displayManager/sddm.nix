{ config, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        setupCommands = "/raphael/home/.screenlayout/display.sh";
        sddm.enable = true;
      };
    };
  }; 
}
