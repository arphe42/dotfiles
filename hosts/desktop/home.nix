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
      protonup-ng
      heroic
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

  # Bluetooth headset buttons
  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };
}
