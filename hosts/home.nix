{ config, lib, pkgs, user, ... }:

{
  imports = [
    ../modules/programs/neovim/neovim.nix
    ../modules/programs/shells.nix
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      flameshot
      rofi

      git
      gh
      lazygit
      tree
      btop
      pfetch
      pulsemixer

      feh
      xdotool
      lxsession
      unzip
      unixtools.xxd
      xorg.xwininfo
      yad

      qpwgraph

      alacritty
      firefox
      brave
      pcmanfm
      keepassxc
      spotify
      onlyoffice-bin
      discord
      heroic
      lutris
      prismlauncher

      gnome.adwaita-icon-theme
    ];

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };

    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;

    bat.enable = true;

    tmux = {
      enable = true;
      extraConfig = ''
        set -g mouse on
      '';
    };
  };
}
