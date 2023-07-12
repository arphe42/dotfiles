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
      BROWSER = "brave";
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
        set -g default-terminal "xterm-256color"
        set-option -ga terminal-overrides ",xterm-256color:Tc"
      '';
    };
  };
}
