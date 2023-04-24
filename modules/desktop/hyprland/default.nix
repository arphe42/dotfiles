{ confi, lib, pkgs, host, system, hyprland, ... }:

{
  imports = [../../programs/waybar.nix];

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
  };

  nixpkgs.overlays = [    # Waybar with experimental features
    (final: prev: {
      waybar = hyprland.packages.${system}.waybar-hyprland;
    })
  ];
}
