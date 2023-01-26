{ config, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        lightdm.enable = true;
        lightdm.extraSeatDefaults = ''
          #display-setup-script = /home/raphael/.screenlayout/display.sh
        '';
      };
    };
  }; 
}
