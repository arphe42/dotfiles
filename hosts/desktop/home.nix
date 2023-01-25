{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # apps
      alacritty
      brave
      firefox
      onlyoffice-bin
      spotify
      discord
      pcmanfm
      keepassxc
      qpwgraph # pipewire config gui

      # games
      xivlauncher
      heroic
      lutris
      prismlauncher

      # window manager thing
      rofi
      feh
      flameshot
      
      # system
      xdotool
      lxsession
      xclip  # to make vim work with system clipboard X11
      # wl-copy wl-paste  # to make vim work with system clipboard Wayland
      unixtools.xxd
      xorg.xwininfo
      yad

      # Icons
      gnome.adwaita-icon-theme
      papirus-icon-theme
      colloid-icon-theme
    ];
  };

  # Bluetooth headset buttons
  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };
}
