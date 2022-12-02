{ pkgs, ... }:

{
  imports = [
    ../../modules/desktop/awesome/home.nix
    ../../modules/programs/emulators.nix
  ];

  home = {
    packages = with pkgs; [
      flameshot
      lxappearance

      pcmanfm
      keepassxc
      spotify
      onlyoffice-bin

      discord
      protonup-ng
      heroic
      lutris
      protontricks
      prismlauncher          # minecraft launcher

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
