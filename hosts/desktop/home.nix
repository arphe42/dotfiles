{ inputs, pkgs, ... }:

{
  imports = [
    ../../modules/programs/alacritty.nix
    ../../modules/programs/spicetify.nix
  ];

  home = {
    packages = with pkgs; [
      # apps
      firefox
      brave
      chromium
      #gimp
      krita
      onlyoffice-bin
      mpv
      discord betterdiscordctl
      ffmpeg
      keepassxc
      bitwarden
      qbittorrent
      obs-studio
      qpwgraph # pipewire config gui
      #remmina
      #moonlight-qt
      openrgb-with-all-plugins
      piper
      #sunshine
      gifski
      jq
      gparted
      vscode
      #ventoy-full
      #unityhub

      # MultiPC/virtualMachine
      #scream
      #deskflow

      # Games
      protontricks
      gamemode
      prismlauncher
      #lutris
      #xivlauncher

      # needed for ALVR (installed in distrobox)
      distrobox
      xorg.xhost
      openvr
      sidequest

      # Emulation
      #retroarchFull
      #yuzu-early-access  # NSwitch
      #suyu
      #citra-nightly      # N3DS
      #pcsx2              # PS2
      #cemu               # WiiU
      #dolphin-emu        # Wii

      # System
      glibc
      python3
      python311Packages.websockets
      yad
      xorg.xwininfo
      unixtools.xxd
      xdotool
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi
      libsForQt5.qt5ct
      libsForQt5.qt5.qtmultimedia qt6.qtmultimedia
      libsForQt5.qt5.qtwebsockets qt6.qtwebsockets
      xclip wl-clipboard clipman
      pciutils
      wine
      nitch

      # OpenJDK
      jdk21
    ];
  };

  services = {
    kdeconnect = {
      enable = true;
      #package = pkgs.kdePackages.kdeconnect-kde;
    };
  };

  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # Bluetooth headset buttons
  systemd.user.services.mpris-proxy = {
    Unit.Description = "Mpris proxy";
    Unit.After = [ "network.target" "sound.target" ];
    Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    Install.WantedBy = [ "default.target" ];
  };
}
