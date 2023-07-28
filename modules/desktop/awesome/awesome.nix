{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      desktopManager = {
        xterm.enable = false;
      };
      windowManager = {
        awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages; [
            luarocks luadbi-mysql
          ];
        };
      };
    };
  };
}
