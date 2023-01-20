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
      git
      gh
      lazygit
      tree
      btop
      pfetch
      pulsemixer

      xdotool
      lxsession

      alacritty
      brave
      piper
    ];
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
