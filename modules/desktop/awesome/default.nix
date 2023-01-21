{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      displayManager = {
        startx.enable = true;
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
