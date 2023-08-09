{ inputs, pkgs, ... }:

{
  imports = [
    ../../modules/programs/alacritty.nix
    ../../modules/desktop/hyprland/home.nix
  ];
  home = {
    packages = with pkgs; [
      # apps
      brave
      firefox
      onlyoffice-bin
      spotify
      spicetify-cli
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
      emulationstation
      retroarchFull
      cemu
      #yuzu-mainline
      yuzu-early-access
      ryujinx
      citra-nightly
      dolphin-emu

      cdecrypt

      # window manager thing
      rofi
      feh

      lxappearance
      dunst
      libsForQt5.polkit-kde-agent

      wofi
      grim
      slurp
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
      qt5.qtwayland  qt6.qtwayland
      wlr-randr
      wlroots
      xdg-utils
      ffmpeg
      pamixer
      playerctl
      mpc-cli
      gifski
      xorg.xrandr
      numlockx
      xdotool
      libnotify
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
      gnome.gnome-themes-extra
      xow_dongle-firmware  # xbox wireless adapter driver

      # Icons
      gnome.adwaita-icon-theme
      papirus-icon-theme
      colloid-icon-theme
      catppuccin-gtk
    ];
  };

  qt.enable = true;
  qt.style.name = "adwaita-dark";
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      #package = pkgs.catppuccin-gtk.override {
      #  accents = [ "red" ];
      #  size = "standard";
      #  tweaks = [ "rimless" "black" ];
      #  variant = "macchiato";
      #};
    };
    cursorTheme = {
      name = "Adwaita";
    };
  };

  # Bluetooth headset buttons
  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };
}
