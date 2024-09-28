{ inputs, pkgs, ... }:

{
  imports = [
    ../../modules/programs/alacritty.nix
    ../../modules/desktop/hyprland/home.nix
    ../../modules/programs/spicetify.nix
  ];

  home = {
    packages = with pkgs; [
      # apps
      brave
      firefox
      onlyoffice-bin
      #spotify
      #spicetify-cli
      discord  betterdiscordctl
      pcmanfm
      krita
      keepassxc
      qpwgraph # pipewire config gui
      transmission-qt
      deluge-gtk
      godot_4
      mpv
      ventoy-full
      remmina
      bitwarden
      moonlight-qt

      # games
      xivlauncher
      clonehero
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
      protonup-qt

      # Emulations
      emulationstation
      retroarchFull
      cemu              # WiiU
      yuzu-early-access # switch
      ryujinx           # switch
      citra-nightly     # 3ds
      melonDS           # nds
      dolphin-emu       # Gamecube and wii
      pcsx2             # ps2

      cdecrypt  # decrypt WiiU games

      # window manager thing
      rofi
      feh

      lxappearance
      dunst
      libsForQt5.polkit-kde-agent

      wofi
      grim
      slurp
      flameshot
      swww
      mpvpaper
      swayidle
      swaylock-effects
      wlogout
      waybar
      jq
      gamescope
      xdg-desktop-portal-hyprland
      
      # system
      i2c-tools
      qt5.qtwayland  qt6.qtwayland
      wlr-randr
      wlroots
      xdg-utils
      networkmanagerapplet
      ffmpeg
      pamixer
      playerctl
      mpc-cli
      gifski
      xorg.xrandr
      numlockx
      xdotool
      ydotool
      libnotify
      inotify-tools
      lxsession
      xscreensaver
      xclip  # to make vim work with system clipboard X11
      wl-clipboard
      clipman
      # wl-copy wl-paste  # to make vim work with system clipboard Wayland
      unixtools.xxd
      xorg.xwininfo
      yad
      python3Full
      openjdk
      gnome.gnome-themes-extra
      xow_dongle-firmware  # xbox wireless adapter driver

      # Icons
      gnome.adwaita-icon-theme
      papirus-icon-theme
      colloid-icon-theme
      catppuccin-gtk
    ];
  };

 #  qt.enable = true;
 #  qt.style.name = "adwaita-dark";
 #  gtk = {
 #    enable = true;
 #    theme = {
 #      name = "Adwaita-dark";
 #      #package = pkgs.catppuccin-gtk.override {
 #      #  accents = [ "red" ];
 #      #  size = "standard";
 #      #  tweaks = [ "rimless" "black" ];
 #      #  variant = "macchiato";
 #      #};
 #    };
 #    cursorTheme = {
 #      name = "Adwaita";
 #    };
 #    font = {
 #      name = "Noto Sans";
 #      size = 10;
 #    };
 #  };

  # Bluetooth headset buttons
  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };
}
