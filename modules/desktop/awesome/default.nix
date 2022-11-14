{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      layout = "us";
      libinput.enable = true;

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

      videoDrivers = [ "nvidia" ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
