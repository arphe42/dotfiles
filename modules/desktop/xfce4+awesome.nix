{ config, lib, pkgs, ... }:

{
  services.xserver = {
    dektopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager = {
      awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks luadbi-mysql
        ];
      };
    };
    displayManager.defaultSession = "xfce+awesome";
  };
}
