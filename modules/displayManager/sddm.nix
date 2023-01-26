{ config, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
      };
    };
  }; 
}
