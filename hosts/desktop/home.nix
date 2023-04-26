{ pkgs, ... }:

{
  imports = [
    ../../modules/programs/an-anime-game-launcher.nix
    ../../modules/desktop/hyprland/home.nix
    ../../modules/programs/alacritty.nix
  ];
  home = {
    packages = with pkgs; [
      # apps
      brave
      firefox
      onlyoffice-bin
      spotify
      spicetify-cli
      discord
      pcmanfm
      krita
      keepassxc
      qpwgraph # pipewire config gui
      transmission-qt
      deluge-gtk
      godot_4

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

      # Emulations
      cemu
      yuzu-mainline
      #citra-nightly
      dolphin-emu

      # window manager thing
      rofi
      feh
      flameshot

      lxappearance
      xfce.xfce4-settings
      dunst
      libsForQt5.polkit-kde-agent

      wofi
      swww
      swayidle
      waybar
      mpd
      jq
      gamescope
      xdg-desktop-portal-hyprland
      grim
      slurp
      
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
