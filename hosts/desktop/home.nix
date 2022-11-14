{ pkgs, ... }:

{
  imports = [
    ../../modules/desktop/awesome/home.nix
  ];

  home = {
    packages = with pkgs; [
      flameshot

      pcmanfm
      keepassxc
      discord
      lutris
      prismlauncher          # minecraft launcher
      spotify

      gnome.adwaita-icon-theme
      networkmanagerapplet
    ];
  };

  services = {
    blueman-applet.enable = true;
  };
}
