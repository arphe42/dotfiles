{ pkgs, ... }:

{
  imports = [
    ../../modules/programs/an-anime-game-launcher.nix
    ../../modules/desktop/hyprland/home.nix
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
      krita
      keepassxc
      qpwgraph # pipewire config gui
      transmission-qt
      deluge-gtk
      godot_4

      # gamesxdotool windowunmap $(xdotool getactivewindow)
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

      # Emulations
      cemu
      yuzu-mainline
      #citra-nightly
      dolphin-emu

      # window manager thing
      rofi
      feh
      flameshot

      #wofi
      swww
      waybar
      mpd
      jq
      gamescope
      xdg-desktop-portal-hyprland
      
      # system
      numlockx
      xdotool
      lxsession
      #xscreensaver
      xclip  # to make vim work with system clipboard X11
      wl-clipboard
      clipman
      # wl-copy wl-paste  # to make vim work with system clipboard Wayland
      unixtools.xxd
      xorg.xwininfo
      yad
      python3Full
      openjdk

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
