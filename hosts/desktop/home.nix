{ pkgs, ... }:

{
  imports = [
    ../../modules/programs/an-anime-game-launcher.nix
  ];
  home = {
    packages = with pkgs; [
      # apps
      alacritty
      brave
      librewolf
      firefox
      onlyoffice-bin
      spotify
      discord
      pcmanfm
      keepassxc
      qpwgraph # pipewire config gui
      transmission-qt
      deluge-gtk

      # games
      xivlauncher
      prismlauncher
      heroic
      lutris
      steamtinkerlaunch
      gamemode
      bottles
      mono
      wine-staging
      winetricks
      protontricks

      # window manager thing
      rofi
      feh
      flameshot
      
      # system
      numlockx
      xdotool
      lxsession
      #xscreensaver
      xclip  # to make vim work with system clipboard X11
      # wl-copy wl-paste  # to make vim work with system clipboard Wayland
      unixtools.xxd
      xorg.xwininfo
      yad
      python3Full

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
