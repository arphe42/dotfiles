{ config, lib, pkgs, host, system, hyprland, ... }:

{
  imports = [../../programs/waybar.nix] ++ 
            [ hyprland.nixosModules.default ];

  programs.hyprland = {
    enable = true;
    #package = hyprland.packages.${pkgs.system}.hyprland;
    #enableNvidiaPatches = true;
    xwayland = {
      enable = true;
      #hidpi = true;
    };
  };

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
}
