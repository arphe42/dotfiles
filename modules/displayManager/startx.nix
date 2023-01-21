{ config, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        startx.enable = true;
      };
    };
  }; 
}
