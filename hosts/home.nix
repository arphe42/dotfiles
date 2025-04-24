{ config, lib, pkgs, user, host, ... }:

{
  imports = [
    ../modules/programs/neovim/neovim.nix
    ../modules/programs/shells.nix
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      git
      gh
      lazygit
      tree
      btop
      pfetch
      pulsemixer
      unzip
      p7zip
    ];

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };

    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;

    bat.enable = true;

    git = {
      enable = true;
      userName = "arphe42";
      userEmail = "arphe42@gmail.com";
    };

    tmux = {
      enable = true;
      extraConfig = ''
        set -g mouse on
        set -g default-terminal "xterm-256color"
        set-option -ga terminal-overrides ",xterm-256color:Tc"
      '';
    };
  };
}
