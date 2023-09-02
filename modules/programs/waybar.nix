{ config, lib, pkgs, host, user, inputs, ... }:

{
  #programs.waybar.package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;

  environment.systemPackages = with pkgs; [
    waybar
  ];
}
