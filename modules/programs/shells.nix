{ pkgs, ... }:

let
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake ~/dotfiles#desktop";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      inherit shellAliases;
    };

    bash = {
      enable = true;
    };
  };
}
