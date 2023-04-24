{ confi, lib, pkgs, host, system, hyprland, ... }:

programs.hyprland = {
  enable = true;
  nvidiaPatches = true;
  xwayland = {
    enable = true;
    hidpi = true;
  }
}
