{ config, lib, pkgs, ... }:

{
  xsession = {
    enable = true;
    numlock.enable = true;
    windowManager = {
      awesome = {
        enable = true;
      };
    };
  };
}
